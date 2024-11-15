# Установка времени обновления
if [ -z "$1" ]; then
    UPDATE_TIME=10
else
    UPDATE_TIME=$1
fi

# Определяем время окончания
END_TIME=$((SECONDS + UPDATE_TIME))

# Открываем файл для записи вывода и ошибок
exec > output.log 2>&1

echo "Скрипт запущен в: $(date)"

# Цикл, который выводит информацию об активных пользователях каждые 2 секунды
while [ $SECONDS -lt $END_TIME ]; do
    CURRENT_TIME=$(date +"%Y-%m-%d %H:%M:%S")
    echo "Текущее время: $CURRENT_TIME"
    echo "Активные пользователи:"
    who
    echo "-------------------------"
    sleep 2
done

echo "Скрипт завершен в: $(date)"
