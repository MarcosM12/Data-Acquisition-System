#pragma once

FILE* createXML();
void writeXML(FILE* f, char* situation, int temp, int hum, int vent);
int closeXML(FILE* f);