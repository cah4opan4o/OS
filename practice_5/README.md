# practice_5
# Скрипт для управления файлами

Это простой bash-скрипт, который позволяет пользователю выполнять базовые операции с файлами в цикле. Скрипт предоставляет меню для копирования, перемещения, создания файлов или выхода из программы.

## Использование

Запустите скрипт в терминале. Скрипт отобразит меню с следующими опциями:

1. **Копировать файл** - Копирует указанный файл в выбранную директорию.
2. **Переместить файл** - Перемещает указанный файл в выбранную директорию.
3. **Создать файл** - Создает пустой файл с указанным именем.
4. **Выход** - Завершает выполнение программы.

## Инструкция

1. Выберите опцию из меню, введя номер (1-4).
2. Для опций 1 и 2 потребуется:
   - Указать имя файла для копирования или перемещения.
   - Указать целевую директорию.
3. Для опции 3 потребуется указать имя нового файла для создания.
4. Скрипт выведет сообщение об ошибке, если указанный файл или директория не существуют.

## Пример

```bash
Список команд:

1) Копировать файл
2) Переместить файл
3) Создать файл
4) Выход
Выберите функцию (1-4): 1

Выберите файл для копирования: example.txt
Директория: /home/user/documents
```

