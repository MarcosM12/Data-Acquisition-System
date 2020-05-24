#include<stdio.h>
#include<winsock2.h>
#include"Socket.h"
#include<Ws2tcpip.h>
#include <stdio.h>
#include <iostream>
#include <conio.h>


#pragma comment(lib,"ws2_32.lib") //Winsock Library
#define _WINSHOCK_DEPRICIATED_NO_WARNINGS



int inic_Lib() {


	WSADATA wsa;
	printf("\nInitialising Winsock...");
	if (WSAStartup(MAKEWORD(2, 2), &wsa) != 0)
	{
		printf("Failed. Error Code : %d", WSAGetLastError());
		return NULL;
	}
	printf("Initialised.");
	return 1;
}

SOCKET inic_Socket() {

	SOCKET s;
	if ((s = socket(AF_INET, SOCK_STREAM, 0)) == INVALID_SOCKET)
	{
		printf("Could not create socket : %d", WSAGetLastError());
		return NULL;
	}
	printf("\nSocket created.\n");
	

	return s;
}

int send_Message(const char* message) {

	SOCKET s=inic_Socket();
	char post_rqst[1000];
	struct sockaddr_in server;
	server.sin_addr.s_addr = inet_addr("193.136.120.133");
	server.sin_family = AF_INET;
	server.sin_port = htons(80);

	//Connect to remote server
	if (connect(s, (struct sockaddr*) & server, sizeof(server)) < 0)
	{
		puts("connect error");
		closesocket(s);
		WSACleanup();
		return -1;
	}

	puts("Connected");
	
	char *str = (char *) malloc(sizeof(message));
	//Send some data
	strcpy(post_rqst, "POST /~sad/  HTTP/1.1\r\n");
	strcat(post_rqst, "Host: SAD\r\n");
	strcat(post_rqst, "Content-type: application/json\r\n");
	sprintf(str, "Content-length: %d\r\n\r\n",  strlen(message));
	strcat(post_rqst, str);
	strcat(post_rqst,message); 
	
	
	if (send(s, post_rqst, strlen(post_rqst), 0) < 0)
	{
		puts(" Send failed ");
		return -1;
	}
	puts(" Data Sent\n ");

	
	return 1;
}



