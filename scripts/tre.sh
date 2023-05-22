#!/bin/bash
#вводим данные
    source=$(whiptail --title "Ввод исходной папки" --inputbox "Ввдите путь откуда вы хотите скопировать файлы" 10 60 /home/breit/otpr 3>&1 1>&2 2>&3)
    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        echo "Вы будете копировать из папки" $source
    else
        echo "Вы выбрали отмену."
    fi

    target=$(whiptail --title "Ввод папки куда копируем" --inputbox "Ввдите путь куда вы хотите скопировать файлы" 10 60 /home/breit/proverka 3>&1 1>&2 2>&3)
    exitstatus=$?
    if [ $exitstatus -eq 0 ]; then
        echo "Вы будете копировать из папки" $source
    else
        echo "Вы выбрали отмену."
    fi

#изменение названия и копирование
    if (whiptail --title "Изменение в названии" --yes-button "Да" --no-button "Нет" --yesno "Хотите ли вы добавить в название файлов что-то?" 10 60) 
        then
        name=$(whiptail --title "Ввод приставки" --inputbox "Введите приставку которую вы хотите добавить" 10 60 copy_ 3>&1 1>&2 2>&3)
    fi

./main.sh "$source" "$target" "$name" 

#конец
    if [ $? -eq 0 ]
        then
        echo "Копирование прошло успешно!"
        whiptail --title "Конец" --msgbox "Копирование прошло успешно!" 10 60
        else
        echo "Копирование не удалось. Ошибка"
    fi