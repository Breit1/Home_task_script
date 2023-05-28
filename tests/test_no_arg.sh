../scripts/main.sh 
if [[ $? == "1" ]]
then 
	echo "Тест пройден" 
else 
	echo "Ошибка" 
	exit 1
fi