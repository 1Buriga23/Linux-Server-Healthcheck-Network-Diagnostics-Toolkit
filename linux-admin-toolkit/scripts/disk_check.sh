#!/bin/bash

if [ -z "$1" ]; then 
	echo "ОШИБКА: имя диска не передано"
	exit 1
fi

if [ "$#" -ne 1 ]; then 
	echo "ОШИБКА: передано больше 1 аргумента в bash-скрипт"
	exit 1
fi

if ! df "$1" &> /dev/null; then 
	echo "ОШИБКА: нету такого диска или указан неправильно путь до него"
	exit 1
fi

PERCENTUSED=$(df "$1" -h | awk 'NR==2 {print $5}' | tr -d "%")

echo "===== DISK CHECK ====="
echo 
echo

echo "Раздел: "$1""
echo "Использовано: "$PERCENTUSED"%"

if (( "$PERCENTUSED" > 80 )); then
	echo "ВНИМАНИЕ: диск заполнен больше чем на 80%"
	exit 2
else
	echo "ОК: места на диске достаточно"
	exit 0
fi
