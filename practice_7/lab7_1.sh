#!/bin/bash

# 1. Перенаправление содержимого файла
cat path_to_your_file > Lab6  

# 2. Проверка правильности выполнения первого задания
echo "Содержимое файла Lab6:"
cat Lab6

# 3. Вывод содержимого файла /etc/passwd и анализ этой информации
echo "Содержимое файла /etc/passwd:"
cat /etc/passwd
echo "Анализ /etc/passwd:"
echo "Файл /etc/passwd содержит информацию о пользователях системы, включая их имена, UID, GID и домашние директории."

# 4. Выполнение команд в конвейере
cd path_to_your_directory && echo "Текущий каталог: $(pwd)" && ls 
cat /etc/passwd | sort -t: -k1,1 > passwd.orig && 
ls

# 5. Вывод содержимого файла passwd.orig и его анализ
echo "Содержимое файла passwd.orig:"
cat passwd.orig
echo "Анализ файла passwd.orig:"
echo "Файл passwd.orig содержит отсортированный по именам пользователей список пользователей системы из /etc/passwd."
