# 1. Вывод содержимого файла из лабораторной работы №1 в файл envs
cat ../fmcs/plot1.gnu > envs

# 2. Убедиться, что задание выполнено корректно, сравнить с исходным
echo "Проверка содержимого файла envs:"
cat envs
echo "Проверка завершена."

# 3. Вывести содержимое файла /etc/passwd и проанализировать
echo "Содержимое /etc/passwd:"
cat /etc/passwd

# 4. Переход в домашний каталог и сортировка содержимого /etc/passwd
cd ~
sort /etc/passwd > passwd.orig
echo "Содержимое /etc/passwd отсортировано и сохранено в passwd.orig."

# 5. Анализ файла passwd.orig
echo "Первые 5 строк файла passwd.orig:"
head -n 5 passwd.orig

# 6. Добавление нового пользователя в файл passwd.orig
echo "Введите информацию о новом пользователе в формате /etc/passwd:"
read new_user_info
echo "$new_user_info" >> passwd.orig
echo "Новая запись добавлена в passwd.orig."

# 7. Проверка добавления записи
echo "Проверка добавления нового пользователя:"
tail -n 1 passwd.orig

# 8. Создать файл a1 с 6-ю строками
echo -e "1. Первая строка\n2. Вторая строка\n3. Третья строка\n4. Четвертая строка\n5. Пятая строка\n6. Шестая строка" > a1
echo "Файл a1 создан."

# 9. Создать файл a2 с аналогичным содержимым
touch a2
echo -e "1. Первая строка\n2. Вторая строка\n3. Третья строка\n4. Четвертая строка\n5. Пятая строка\n6. Шестая строка" > a2
echo "Файл a2 создан."

# 10. Проверка файлов и сохранение результата команды ls -l в f3
echo "Содержимое файлов a1 и a2:"
cat a1
cat a2
ls -l a1 a2 > f3
echo "Результат команды ls -l сохранен в f3."

# 11. Копирование первых двух строк из a1 в a2 и добавление последних двух строк из a1 в f3
head -n 2 a1 >> a2
tail -n 2 a1 >> f3
echo "Первые две строки a1 добавлены в a2, последние две строки a1 добавлены в f3."

# 12. Сортировка файла a2 по второму столбцу и сохранение в a2_s2
sort -k 2 a2 > a2_s2
echo "Файл a2 отсортирован по второму столбцу и сохранен в a2_s2."
echo "Содержимое файла a2_s2:"
cat a2_s2

# 13. Создание файла mix, содержащего строки из a2, a1, и f3
(head -n 2 a2; sed -n '3p' a1; sed -n '4p;5p' f3) > mix
echo "Файл mix создан с необходимыми строками."

# 14. Поиск строк с цифрой 3 в домашней директории и сохранение результата в a_g
grep -r "3" ~ > a_g
echo "Результат поиска строк с цифрой 3 в домашней директории сохранен в a_g."

# 15. Поиск файлов в /etc, содержащих IP-адреса, и сохранение уникальных имен файлов в g_ip
grep -rlE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" /etc | cut -d '/' -f 3 | sort | uniq > g_ip
echo "Файлы с IP-адресами найдены и сохранены в g_ip."

# 16. Получение списка файлов с буквой 'а' в имени в домашней директории
find ~ -type f -name "*a*" | sort | uniq > spisok_a
echo "Список файлов с буквой 'а' в имени сохранен в spisok_a."

echo "END!"