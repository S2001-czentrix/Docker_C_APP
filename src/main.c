#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    FILE *fp = fopen("/data/test.txt", "a");
    if (fp == NULL) {
        perror("Failed to open file");
        return 1;
    }

    time_t now = time(NULL);
    fprintf(fp, "Log time: %s", ctime(&now));
    fprintf(fp, "This is a paragraph written by a C program in Docker, running in Kubernetes!\n\n");

    fclose(fp);
    printf("Successfully wrote to test.txt\n");

    return 0;
}

