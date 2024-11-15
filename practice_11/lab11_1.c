#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>

#define END_OF_DATA 26  // Код завершения передачи (Ctrl+Z)

// Функция для подсчета скобок и проверки баланса
int check_parentheses_balance(const char *expression, int *open_count, int *close_count) {
    *open_count = 0;
    *close_count = 0;
    
    for (int i = 0; expression[i] != ' '; i++) {
        if (expression[i] == '(') {
            (*open_count)++;
        } else if (expression[i] == ')') {
            (*close_count)++;
        }
    }
    // Проверка сбалансированности
    return *open_count == *close_count;
}

// Основная программа
int main() {
    int pipe_fd[2];
    pid_t pid;
    char buffer[256];
    int open_count = 0, close_count = 0;
    const char *input_filename = "primer.txt";  // Исходный файл из ЛР №1
    const char *output_filename = "result.txt";  // Файл для вывода результата

    // Создание канала
    if (pipe(pipe_fd) == -1) {
        perror("Ошибка при создании канала");
        exit(EXIT_FAILURE);
    }

    // Порождение дочернего процесса
    pid = fork();

    if (pid < 0) {
        perror("Ошибка при порождении дочернего процесса");
        exit(EXIT_FAILURE);
    } else if (pid > 0) {
        // Родительский процесс

        // Закрываем конец канала для чтения
        close(pipe_fd[0]);

        // Открываем файл для чтения
        FILE *file = fopen(input_filename, "r");
        if (file == NULL) {
            perror("Ошибка при открытии файла для чтения");
            close(pipe_fd[1]);
            exit(EXIT_FAILURE);
        }

        // Чтение содержимого файла и отправка в канал
        while (fgets(buffer, sizeof(buffer), file) != NULL) {
            write(pipe_fd[1], buffer, strlen(buffer));
        }

        // Передача символа с кодом 26 для завершения
        char end_char = END_OF_DATA;
        write(pipe_fd[1], &end_char, 1);

        // Закрываем файл и конец канала
        fclose(file);
        close(pipe_fd[1]);

        // Ожидание завершения дочернего процесса
        wait(NULL);

    } else {
        // Дочерний процесс

        // Закрываем конец канала для записи
        close(pipe_fd[1]);

        // Открытие файла для записи результата
        FILE *output_file = fopen(output_filename, "w");
        if (output_file == NULL) {
            perror("Ошибка при открытии файла для записи");
            close(pipe_fd[0]);
            exit(EXIT_FAILURE);
        }

        // Чтение из канала и накопление данных в буфере
        char expression[1024] = "";
        int bytes_read;

        while ((bytes_read = read(pipe_fd[0], buffer, sizeof(buffer) - 1)) > 0) {
            buffer[bytes_read] = '\0';
            if (strchr(buffer, END_OF_DATA) != NULL) break;  // Прекращаем при встрече END_OF_DATA
            strcat(expression, buffer);
        }

        // Проверка баланса скобок
        int is_balanced = check_parentheses_balance(expression, &open_count, &close_count);

        if (is_balanced) {
            fprintf(output_file, "Скобки сбалансированы.\n");
        } else {
            fprintf(output_file, "Несбалансированные скобки:\n");
            fprintf(output_file, "Открывающихся скобок: %d\n", open_count);
            fprintf(output_file, "Закрывающихся скобок: %d\n", close_count);
        }

        // Закрытие файла и канала
        fclose(output_file);
        close(pipe_fd[0]);

        exit(0);
    }

    return 0;
}
