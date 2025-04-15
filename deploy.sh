#!/bin/bash

# Параметры подключения к удаленной машине
REMOTE_USER=apollon-2
REMOTE_HOST=192.10.10.2
REMOTE_PATH=/usr/local/bin

# Локальные файлы артефактов
LOCAL_FILES=("src/cat/s21_cat" "src/grep/s21_grep")

# Копирование файлов на удаленную машину
for FILE in "${LOCAL_FILES[@]}"; do
    scp $FILE $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH
    if [ $? -ne 0 ]; then
        echo "Ошибка копирования файла $FILE"
        exit 1
    fi
done

echo "Деплой завершен успешно."
