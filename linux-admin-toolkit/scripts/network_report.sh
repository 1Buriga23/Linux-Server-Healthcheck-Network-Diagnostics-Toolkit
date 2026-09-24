#!/bin/bash

echo "===== СЕТЕВОЙ ОТЧЁТ ====="

echo "IP-адреса:"
ip addr

echo

echo "Маршруты:"
ip route

echo

echo "Проверка доступа к внешнему IP:"
if ping -c 4 8.8.8.8 &> /dev/null; then
	echo "ОК: внешний IP доступен"
else
	echo "Error: внешний IP недоступен"
fi

echo

echo "Проверка DNS:"
if getent hosts google.com &> /dev/null; then
	echo "ОК: доменное имя успешно резолвится"
else
	echo "ERROR: доменное имя не резолвится"
fi

