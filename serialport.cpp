
#include <windows.h>
#include <stdio.h>


// Declare variables and structures



HANDLE comSetup() {
	HANDLE hSerial=NULL;
	// Open the highest available serial port number
	DCB dcbSerialParams = { 0 };
	COMMTIMEOUTS timeouts = { 0 };
	fprintf(stderr, "Opening serial port...");
	hSerial = CreateFileA(
		"COM2", GENERIC_READ | GENERIC_WRITE, 0, NULL,
		OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
	if (hSerial == INVALID_HANDLE_VALUE)
	{
		fprintf(stderr, "Error\n");
		return NULL;
	}
	else {
		fprintf(stderr, "OK\n");
	}

	// Set device parameters (38400 baud, 1 start bit,
	// 1 stop bit, no parity)
	dcbSerialParams.DCBlength = sizeof(dcbSerialParams);
	if (GetCommState(hSerial, &dcbSerialParams) == 0)
	{
		fprintf(stderr, "Error getting device state\n");
		CloseHandle(hSerial);
		return NULL;
	}

	dcbSerialParams.BaudRate = CBR_9600;
	dcbSerialParams.ByteSize = 8;
	dcbSerialParams.StopBits = ONESTOPBIT;
	dcbSerialParams.Parity = NOPARITY;
	if (SetCommState(hSerial, &dcbSerialParams) == 0)
	{
		fprintf(stderr, "Error setting device parameters\n");
		CloseHandle(hSerial);
		return NULL;
	}

	// Set COM port timeout settings
	timeouts.ReadIntervalTimeout = 50;
	timeouts.ReadTotalTimeoutConstant = 50;
	timeouts.ReadTotalTimeoutMultiplier = 10;
	timeouts.WriteTotalTimeoutConstant = 50;
	timeouts.WriteTotalTimeoutMultiplier = 10;

	if (SetCommTimeouts(hSerial, &timeouts) == 0)
	{
		fprintf(stderr, "Error setting timeouts\n");
		CloseHandle(hSerial);
		return NULL;
	}
	return hSerial;
}


