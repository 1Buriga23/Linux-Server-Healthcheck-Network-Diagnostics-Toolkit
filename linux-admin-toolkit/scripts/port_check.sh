#!/bin/bash

echo "===== ПРОВЕРКА ПОРТОВ ====="

echo

echo "Открытые listening-порты:"
ss -tuln

echo

echo "Проверка порта 80:"
if ss -tuln | grep ":80";then
	echo "ОК: порт 80 слушается"
else
	echo "Warning: порт 80 не слушается"
fi
