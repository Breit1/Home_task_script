../scripts/main.sh ../tests/otkuda ../tests/kuda
if [[ $? == "0" ]]
then 
	echo "Тест пройден" 
else 
	echo "Ошибка" 
	exit 1
fi

