#!/bin/bash

MEMTOTAL=$(free -h | awk '/Mem:/ {print $2}')
MEMUSED=$(free -h | awk '/Mem:/ {print $3}')
MEMTOTALNOTREAD=$(free | awk '/Mem:/ {print $2}')
MEMUSEDNOTREAD=$(free | awk '/Mem:/ {print $3}')

MEMUSEDPERCENT=$(($MEMUSEDNOTREAD*100/$MEMTOTALNOTREAD))

SWAPTOTAL=$(free -h | awk '/Swap:/ {print $2}')
SWAPUSED=$(free -h | awk '/Swap:/ {print $3}')

echo "===== ПРОВЕРКА ПАМЯТИ ====="
echo

echo "Оперативная память:"
echo "Всего: $MEMTOTAL"
echo "Использовано: $MEMUSED"
echo "Процент использования: "$MEMUSEDPERCENT"%"

echo

echo "Swap:"
echo "Всего: $SWAPTOTAL"
echo "Использовано: $SWAPUSED"
echo 

if (("$MEMUSEDPERCENT" > 80)); then
	echo "ВНИМАНИЕ: использование оперативной памяти больше 80%"
else
	echo "ОК: использование оперативной памяти в норме"
fi
