#pragma once
#include<stdio.h>


#pragma comment(lib,"ws2_32.lib") //Winsock Library

int inic_Lib();
SOCKET inic_Socket();
int send_Message(const char* message);


