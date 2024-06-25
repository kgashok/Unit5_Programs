#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NUM_RECORDS 120

typedef struct {
    unsigned int acct_num;
    char last_name[15];
    char first_name[10];
    double balance;
} client_data;

void createBinaryFile(const char *filename) {
    FILE *file = fopen(filename, "wb");
    if (file == NULL) {
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    for (int i = 0; i < NUM_RECORDS; i++) {
        client_data record;
        record.acct_num = i + 1;
        snprintf(record.last_name, 15, "LastName%d", i + 1);
        snprintf(record.first_name, 10, "First%d", i + 1);
        record.balance = (double)(i * 100.0);  // Just an example balance

        fwrite(&record, sizeof(client_data), 1, file);
    }

    fclose(file);
}

int main() {
    const char *filename = "records.bin";
    createBinaryFile(filename);
    printf("Binary file '%s' created with %d records.\n", filename, NUM_RECORDS);
    return 0;
}
