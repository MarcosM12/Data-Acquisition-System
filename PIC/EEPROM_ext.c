/*
 * File:   EEPROM_ext.c
 * Author: teixe
 *
 * Created on 7 de Maio de 2020, 18:11
 */


#include <xc.h>
#include<string.h>
//I2C

void i2cSetup(const unsigned long baud) {
    SSPCON = 0b00101000;
    SSPCON2 = 0;
    SSPADD = (4000000 / (4 * baud)) - 1;
    SSPSTAT = 0;

}

void i2c_Wait() {
    while ((SSPSTAT & 0x04) || (SSPCON2 & 0x1F));
}

void i2c_Start() {
    i2c_Wait();
    SEN = 1;
}

void i2c_Restart() {
    i2c_Wait();
    RSEN = 1;
}

void i2c_Stop() {
    i2c_Wait();
    PEN = 1;
}

unsigned char i2c_Write(char data) {
    i2c_Wait();
    SSPBUF = data;
    while (!SSPIF); // Wait Until Completion
    SSPIF=0;
    return ACKSTAT;
}

unsigned char i2c_Read(void) {
    //---[ Receive & Return A Byte ]---
    i2c_Wait();
    RCEN = 1; // Enable & Start Reception
    while (!SSPIF); // Wait Until Completion
    SSPIF = 0; // Clear The Interrupt Flag Bit
    i2c_Wait();
    return SSPBUF; // Return The Received Byte
}

void i2c_ACK(void) {
    ACKDT = 0; // 0 -> ACK
    i2c_Wait();
    ACKEN = 1; // Send ACK
}

void i2c_NACK(void) {
    ACKDT = 1; // 1 -> NACK
    i2c_Wait();
    ACKEN = 1; // Send NACK
}


//EEPROM

void EEPROM_Write(int add, char data) {

    i2c_Start();
    while (i2c_Write(0xA0))
        i2c_Restart();
    i2c_Write(add >> 8);
    i2c_Write((unsigned char) add);
    i2c_Write(data);
    i2c_Stop();

}

unsigned char EEPROM_Read(int add) {

    unsigned char Data;
    i2c_Start();
    while (i2c_Write(0xA0))
        i2c_Restart();

    i2c_Write(add >> 8);
    i2c_Write((unsigned char) add);
    i2c_Restart();

    i2c_Write(0xA1);
    Data = i2c_Read();
    i2c_NACK();
    i2c_Stop();

    return Data;
}

// EEPROM Write Page

void EEPROM_Write_Page(int add, char* data) {

    i2c_Start();
    while (i2c_Write(0xA0))
        i2c_Restart();
    i2c_Write(add >> 8);
    i2c_Write((unsigned char) add);

    unsigned int len = strlen(data);
    for (unsigned int i = 0; i < len; i++)
        i2c_Write(data[i]);

    i2c_Stop();
}

//---[ Sequential Read ]---

unsigned char* EEPROM_Read_Page(int add, char* data, int len) {
   

    i2c_Start();

    while (i2c_Write(0xA0))
        i2c_Restart();
    i2c_Write(add >> 8);
    i2c_Write((unsigned char) add);
    i2c_Restart();
    i2c_Write(0xA1);

    for (unsigned int i = 0; i < len; i++) {
        data[i] = i2c_Read();
        i2c_ACK();
    }
    data[len]='\0';
    i2c_Stop();

    return data;
}