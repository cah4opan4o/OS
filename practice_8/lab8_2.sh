# Запуск первого сценария в фоновом режиме с параметрами N и M
N=2  # Интервал в секундах
M=10 # Общее время в секундах

./lab8_1.sh $N $M &

# Сохранение PID фонового процесса
pid=$!

# Ожидание завершения фонового процесса
wait $pid

# Вывод сообщения о продолжительности ожидания
echo "Продолжительность ожидания составила $M секунд."
