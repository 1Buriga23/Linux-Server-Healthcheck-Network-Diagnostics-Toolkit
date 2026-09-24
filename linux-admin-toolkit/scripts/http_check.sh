#!/bin/bash

echo "===== ПРОВЕРКА HTTP ====="

if (( "$#" == 1 )); then
	CURRENTURL="$1"
fi
if (( "$#" > 1 )); then
	echo "Ошибка: указано больше 1 аргумента для bash-скрипта"
	exit 1
fi
if (( "$#" == 0 )); then
	CURRENTURL="localhost"
fi 

HTTPCODE=$(curl -s -o /dev/null -w "%{http_code}" --max-time 5 "$CURRENTURL" )
FIRSTDIGIT="${HTTPCODE:0:1}"
echo

echo "URL: $CURRENTURL"
echo "HTTP-код: $HTTPCODE"
case "$FIRSTDIGIT" in
	2)
		echo "ОК: успешный ответ"
       		;;
	3)
        	echo "ОК: сервис отвечает, получен redirect"
        	;;
    	4)
        	echo "WARNING: ошибка на стороне клиента"
        	;;
    	5)
        	echo "ERROR: ошибка на стороне сервера"
        	;;
    	*)
        	echo "ERROR: неизвестный или недоступный HTTP-код"
        	;;
esac

