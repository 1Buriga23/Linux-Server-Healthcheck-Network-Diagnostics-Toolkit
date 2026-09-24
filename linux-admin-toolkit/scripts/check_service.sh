#!/bin/bash

if [ -z "$1" ]; then 
	echo "ОШИБКА: имя службы не передано"
	exit 1
fi

if [ "$#" -ne 1 ]; then 
	echo "ОШИБКА: передано больше 1 аргумента в bash-скрипт"
	exit 1
fi
echo "SERVICE CHECK: $1"
if systemctl is-active "$1" &> /dev/null; then 
	echo "OK: служба "$1" работает"
	exit 0
else
	echo "ОШИБКА: служба "$1" не активна"
	exit 1
fi
