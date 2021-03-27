/*
 * File:   main.c
 * Author:Marcos Mateus,F¨¢bio Greg¨®rio, Miguel Rafael 
 *
 * Created on April 23, 2020, 11:53 AM
 */
#pragma config FOSC = HS // Oscillator Selection bits (HS oscillator)
#pragma config WDTE = OFF // Watchdog Timer Enable bit
#pragma config PWRTE = OFF // Power-up Timer Enable bit
#pragma config BOREN = OFF // Brown-out Reset Enable bit
#pragma config LVP = OFF // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit
#pragma config CPD = OFF // Data EEPROM Memory Code Protection bit
#pragma config WRT = OFF // Flash Program Memory Write Enable bits
#pragma config CP = OFF // Flash Program Memory Code Protection bit

#include <xc.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include "EEPROM_ext.h"
#define _XTAL_FREQ 4000000
long int count = 0;
int veloc = 635;
int old_Veloc = 635;

int send = 0, s = 0, received = 0, start = 0;
int em1 = 1, em2 = 1;

// delay - força um delay com um dado tempo
// time - tempo pretendido

void delay(int time) {
    int i;
    for (i = 0; i < time; i++) {
    }
}

void uartSendChar(char data) {

    TXREG = data;
    while (!PIR1bits.TXIF);

}

void uartSendString(char *str) {
    int i;

    for (i = 0; str[i] != '\0'; i++)
        uartSendChar(str[i]);
    TXIF = 0;
}

void usartSetup(void) {
    TXSTAbits.TXEN = 1;
    TXSTAbits.TX9 = 0;
    TXSTAbits.SYNC = 0;
    TXSTAbits.BRGH = 1;
    RCSTAbits.SPEN = 1;
    RCSTAbits.RX9 = 0;
    RCSTAbits.CREN = 1;
    SPBRG = 25;

}

void adcSetup() {
    ADCON0 = 0b11000001;
    ADCON1 = 0b11000000;
}

void PWMSetup() {
    PR2 = (4000000 / (5000 * 4 * 4)) - 1;
    T2CONbits.T2CKPS1 = 0;
    T2CONbits.T2CKPS0 = 1;
    T2CONbits.TMR2ON = 1;
    CCP1CONbits.CCP1M3 = 1;
    CCP1CONbits.CCP1M2 = 1;

}

void PWMDuty(unsigned int duty) {

    if (duty < 1023) {
        duty = ((float) duty / 1023)*(4000000 / (5000 * 4));
        CCP1X = duty;
        CCP1Y = duty;
        CCPR1L = duty >> 2;
    }
}

__interrupt() void timer() {

    if (TMR0IF) {
        TMR0IF = 0; //Resetting the overflow flag
        count++; //Increasing by 1
        if (count == 60000) {
            count = 0; //when count reaches 60000 - Resets
            send = 1;
        } else {
            if (s == 1000) {
                s = 0;
                old_Veloc = veloc;
                int countTimer1 = (TMR1H << 8) + TMR1L;
                veloc = countTimer1;

                TMR1H = 0b00000000;
                TMR1L = 0b00000000;
            } else s++;


        }
    }
    if (RCIF) {
        received = 1;

    }
    if (INTF) {
        INTF = 0;

        if (start)
            start = 0;
        else {
            start = 1;

        }

    }

}

void buzzer() {

    PORTCbits.RC1 = 1;
    __delay_ms(1000);
    PORTCbits.RC1 = 0;
    PORTC;

}


// valuefromSensor - retorna o valor que um sensor num canal dado está a ler
// channel - canal onde o sensor se encontra ligado

unsigned int valuefromSensor(unsigned int channel) {
    ADCON0 &= 0x11000101;
    ADCON0 |= channel << 3;
    GO_nDONE = 1;
    while (GO_nDONE);
    return ((ADRESH << 8) + ADRESL);
}

void sendMessage(int temp, int humidade, int velVent, char* situation) {
    char temp_buf[90];
    sprintf(temp_buf, "\r\n{\n\"Sit\":\"%s\",\n\"Temp\":%d,\n\"Hum\":%d,\n\"Vel\":%d\n}\r\n", situation, temp, humidade, velVent);
    temp_buf[strlen(temp_buf) + 1] = '\0';
    uartSendString(temp_buf);
}

int main(void) {



    TRISBbits.TRISB1 = 1; //RB0
    TRISBbits.TRISB3 = 1; //RB3 

    TRISCbits.TRISC0 = 1; //Oscilador externo
    TRISCbits.TRISC2 = 0; //Ventoinha
    TRISCbits.TRISC1 = 0; //Buzzer
    TRISCbits.TRISC5 = 0; //Aquecedor
    TRISCbits.TRISC6 = 1; //TX
    TRISCbits.TRISC7 = 1; //RX

    usartSetup();
    INTCONbits.GIE = 1;
    INTCONbits.INTE = 1;


    if (start) {

        INTCONbits.PEIE = 1;
        //TESTE INICIAL DA EEPROM EXTERNA 
        char teste[6];
        i2cSetup(9600);
        EEPROM_Write_Page(0, "PIC ON");
        EEPROM_Read_Page(0, teste, 6);
        uartSendString(teste);


        adcSetup();
        PWMSetup();
        PORTCbits.RC2 = 1;
        //TIMER 1
        T1CON = 0b00001011;
        //TIMER 0
        OPTION_REG = 0b00000001;
        INTCONbits.TMR0IE = 1;

        int param_temp = 80, param_hum = 60, param_vel = 300, rajada = 300;


        while (start) {

            int temp = valuefromSensor(2);
            int hum = valuefromSensor(1);

            PWMDuty(valuefromSensor(0));


            if (send) {

                sendMessage(temp, hum, veloc, "EV");
                send = 0;
            }
            if (received) {
                char name = RCREG;
                if (name == 'h') {
                    sendMessage(temp, hum, veloc, "H");
                    received = 0;
                    RCIF = 0;
                } else if (name == 'A') {
                    param_temp = 60;
                    param_hum = 30;
                    param_vel = 150;
                    received = 0;
                    RCIF = 0;
                } else if (name == 'a') {
                    param_temp = 100;
                    param_hum = 300;
                    param_vel = 400;
                    received = 0;
                    RCIF = 0;
                } else if (name == 'B') {
                    rajada = 200;
                    received = 0;
                    RCIF = 0;
                } else if (name == 'b') {
                    rajada = 400;
                    received = 0;
                    RCIF = 0;
                }
            }


            if ((veloc - old_Veloc) >= rajada && em2 == 1) {
                sendMessage(temp, hum, veloc, "EM2");
                buzzer();
                em2 = 0;

            } else if ((veloc - old_Veloc) < rajada && em2 == 0) {
                em2 = 1;

            } else if (temp >= param_temp && hum <= param_hum && veloc >= param_vel && em1 == 1) {
                em1 = 0;
                sendMessage(temp, hum, veloc, "EM1");
                buzzer();
            } else if ((hum > param_hum) && em1 == 0)
                em1 = 1;




            if (!PORTBbits.RB3) {
                switch (PORTCbits.RC5) {
                    case 0:
                    {
                        while (!PORTBbits.RB3);
                        PORTCbits.RC5 = 1;

                    }
                        break;
                    case 1:
                    {
                        while (!PORTBbits.RB3);
                        PORTCbits.RC5 = 0;
                    }
                        break;
                }
            }
        }


    }
    T2CONbits.TMR2ON = 0;
    T1CON = 0;
    OPTION_REG = 0;
    INTCONbits.GIE = 0;
    INTCONbits.TMR0IE = 0;
    INTCONbits.PEIE = 0;
    PORTCbits.RC2 = 0;
    PORTCbits.RC5 = 0;
    veloc = 635, old_Veloc = 635, count = 0, s = 0;


    return 0;
}
