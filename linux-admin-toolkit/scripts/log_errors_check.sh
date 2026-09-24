#!/bin/bash


if [ -z "$1" ]; then
	echo "ОШИБКА: имя службы не передано"
	exit 1
fi

if [ "$#" -ne 1 ]; then
	echo "ОШИБКА: передано больше 1 аргумента в bash-скрипт"
	exit 1
fi
JOURNAL=$(journalctl -u "$1" -n 10 --no-pager)
echo "===== ПРОВЕРКА ЛОГОВ СЛУЖБЫ ====="

echo

echo "Служба: "$1""

echo

if echo "$JOURNAL" | grep -Ei 'error|warning|failed' &> /dev/null; then
	echo "Найдены подозрительные строки:"
	echo "$JOURNAL" | grep -Ei 'error|warning|failed'
	echo
	echo "Результат:"
     	echo "ВНИМАНИЕ: в логах найдены ошибки или предупреждения"
	exit 2
else
	echo "Последние записи журнала:"
	echo "$JOURNAL"
	echo
	echo "Результат:"
     	echo "ОК: явных ошибок в последних логах не найдено"
	exit 0
fi
