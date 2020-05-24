#include <windows.h>
#include <stdio.h>

const char* header = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n\n";


FILE* createXML() {

	FILE *f;
	char xmlfile[13];
	strcpy(xmlfile, "xml_file");
	strcat(xmlfile, ".xml");
	f = fopen(xmlfile, "w");
	if (f == NULL) {
		printf("\nError creating file.\n");
		return NULL;
	}
	else {
		printf("\nFile created with success.\n");
		fprintf(f, header);
		return f;
	}
}

void writeXML(FILE* f, char* situation, int temp, int hum, int vent) {
	
	fprintf(f, "<event>\n");
	fprintf(f, "<situation> %s </situation>\n", situation);
	fprintf(f, "   ");
	fprintf(f, "<temperature> %d </temperature>\n", temp);
	fprintf(f, "   ");
	fprintf(f, "<humidity> %d </humidity>\n", hum);
	fprintf(f, "   ");
	fprintf(f, "<wind_velocity> %d </wind_velocity>\n", vent);
	fprintf(f, "</event>\n");

}

int closeXML(FILE* f) {
	int close = fclose(f);
	if (close == 0)
		return 1;
	else
		return 0;
}

