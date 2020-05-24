

#include <windows.h>
#include <stdio.h>
#include<string.h>
#include<conio.h>
#include<time.h>
#include "serialport.h"
#include "Socket.h"
#include "xml.h"
#include"cJSON-master/cJSON.h"



int temp = 0, hum = 0, vent = 0;
char* sit = NULL;


char* get_time()
{

	time_t mytime = time(NULL);
	char* time_str = ctime(&mytime);
	time_str[strlen(time_str) - 1] = '\0';
	 return time_str;
}



int parse_json(char* message) {
	cJSON* items = NULL;
	cJSON* integer = NULL;
	cJSON* json = cJSON_Parse(message);
	
	if (NULL == json) {
		
		return 0;
	}
	else{

		items = cJSON_GetObjectItem(json, "Sit");
		if(items ==NULL){
			
			cJSON_Delete(json);
			return 0;
		}
		else{
			sit=items->valuestring;
		}
		integer = cJSON_GetObjectItem(json, "Temp");
		if(integer == NULL){
			cJSON_Delete(json);
			return 0;
		}
		else 
			temp = integer->valueint;
		integer = cJSON_GetObjectItem(json, "Hum");
		if (integer == NULL) {
			cJSON_Delete(json);
			return 0;
		}
		else
			hum = integer->valueint;
		integer = cJSON_GetObjectItem(json, "Vel");
		if (integer == NULL) {
			cJSON_Delete(json);
			return 0;
		}
		else
			vent = integer->valueint;
	}
	
	
	return 1;
}


int main()
{
	HANDLE hSerial = comSetup();
	HANDLE screen = GetStdHandle(STD_OUTPUT_HANDLE);
	inic_Lib();

		if (hSerial != NULL) {

			int appON=1,i=0;

			FILE* f = createXML();
			
			printf("\nA espera da ligacao com o PIC...\n");
			while (i == 0) {
				char message_received[7];
				DWORD bytes_written = 0, total_bytes_written = 0;
				ReadFile(hSerial, message_received, 7, &bytes_written, NULL);
				if (bytes_written) {

					if (strcmp(message_received, "PIC ON")) {
						WriteFile(screen, message_received, bytes_written, &total_bytes_written, NULL); //le do buffer para o screen
						i = 1;
					}
				}
			}
			while(appON) {
				
				int modo_escuta = 1;

				if (modo_escuta) {
				
					char message_received[90];
					char post_msg[120];
					DWORD bytes_written = 0, total_bytes_written = 0;
					ReadFile(hSerial, message_received, 90, &bytes_written, NULL);
					if (bytes_written) {

						message_received[bytes_written + 1] = '\0';
						int i = parse_json(message_received);
						if (i == 1) {

							writeXML(f, sit, temp, hum, vent);
							sprintf(post_msg, "{\n\"Time:\":\"%s\",\n\"Situation\": \"%s\",\n\"Temperature\":%d,\n\"Humidity\":%d,\n\"WindVelocity\":%d\n}", get_time(), sit, temp, hum, vent);
							send_Message(post_msg);
							WriteFile(screen, message_received, bytes_written, &total_bytes_written, NULL); //le do buffer para o screen
						}
						
						
					}
			

				}
				if (_kbhit()) {	
					DWORD written = 0;
				
					if (_getch()) {
						modo_escuta = 0;
						int opcao = 0;

						while (!modo_escuta && !opcao) {

							printf("\n-----------------------\n");
							printf("--------- MENU --------\n");
							printf("-----------------------\n\n");
							printf("> Alterar parametros:\n");
							printf("1 - Emergencia 1: Risco de Incendio\n");
							printf("2 - Emergencia 2: Rajada forte\n\n");
							printf("3 - Ver Historico\n");
							printf("4 - Regressar ao modo de Escuta\n\n");
							printf("5 - Sair da App\n\n");
							printf("Selecione a opcao:");						
							scanf("%d", &opcao);
							getchar();

						
								switch (opcao) {
							
									case 1: {
										int em1_opc = 0;
										char em1;
										while (em1_opc == 0) {
											printf("Escolha sensibilidade da Emergencia 1 - Risco de Incendio \n(alta temperatura, baixa humidade, elevada velocidade do vento): \n");
											printf("1 - Elevada\n");
											printf("2 - Baixa\n");
											scanf("%d", &em1_opc);
											getchar();


											switch (em1_opc) {
											case 1: em1 = 'A'; break;
											case 2: em1 = 'a'; break;
											default: em1_opc = 0; printf("Opcao Errada!\n");
											}
										}

										boolean writeT = WriteFile(hSerial, &em1, 1, &written, NULL);

										if (writeT)
											printf("Parametros enviado com sucesso!\n");
										else
											printf("ERRO!\n");

										break;
									}
									case 2: {
										int em2_opc = 0;
										char em2;

										while (em2_opc == 0) {
											printf("Escolha sensibilidade da Emergencia 2 - Rajada forte de vento\n");
											printf("1 - Elevada\n");
											printf("2 - Baixa\n");
											scanf("%d", &em2_opc);
											getchar();

											switch (em2_opc) {
												case 1: em2 = 'B'; break;
												case 2: em2 = 'b'; break;
												default: em2_opc = 0; printf("Opcao Errada!\n");
											}
										}

										boolean writeT = WriteFile(hSerial, &em2, 1, &written, NULL);

										if (writeT)
											printf("Parametros enviado com sucesso!\n");
										else
											printf("ERRO!\n");

										break;
									}
									case 3: {
										DWORD char_written = 0,bytes_to_write=0, bytes_read=0;
										char hist = 'h';
										char hist_message[90];
										WriteFile(hSerial, &hist, 1, &char_written, NULL);
										ReadFile(hSerial, hist_message, 90, &bytes_read, NULL);
										hist_message[bytes_read + 1] = '\0';
										if (strchr(hist_message, 'H')) {
											WriteFile(screen, hist_message, bytes_read, &bytes_to_write, NULL);									
										}
										break;
									}
									case 4: {
										modo_escuta = 1;
										printf("Modo escuta ativo!\n");
									
										break;
									}
									case 5: {
										appON=0;
										fprintf(stderr, "Closing serial port...");
										if (CloseHandle(hSerial) == 0)
										{
											fprintf(stderr, "Error\n");
											return 1;
										}
										fprintf(stderr, "OK\n");

										fprintf(stderr, "Closing XML file...");
										if (closeXML(f) == 0)
										{
											fprintf(stderr, "Error\n");
											return 1;
										}
										fprintf(stderr, "OK\n");
										break;

									}
									default: {
										modo_escuta = 0; 
										opcao=0;
										printf("Opcao Errada!\n");
										break;
									}
								
								}
							}
					}
				}
			
		}


	}

	return 0;
}
	

	

