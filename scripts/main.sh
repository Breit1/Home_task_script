#!/bin/bash
#аргументы
    if [[ ! -n $1 || ! -n $2 ]]
        then
            echo "Не все аргументы переданы"
            exit 1    
    fi
#существует ли папка откуда мы копируем
    if [[ -d "$1" ]]
        then
            echo "Исходная папка $1 найдена, продолжаем"
        else 
            echo "Исходная папка не найдена"
            exit 1
    fi

#существует ли папка куда копируем
    if [[ -d "$2" ]]    
        then
            echo "$2 существует, выполняем копирование"
        else 
            echo "Директории не существует, создаём $2 и копируем туда"
            mkdir -p $2
    fi
#добавление приставки
    prefix=$3 
        for file in "$1"/*
                do
                    if [[ -f "$file" ]]
                    then
                        echo "Копируем файл $file"
                        cp "$file" "$2/$prefix$(basename "$file")"
                    fi
                done


#конец
    if [ $? -eq 0 ]
        then
        echo "Копирование прошло успешно!"
        else
        echo "Копирование не удалось. Ошибка"
    fi