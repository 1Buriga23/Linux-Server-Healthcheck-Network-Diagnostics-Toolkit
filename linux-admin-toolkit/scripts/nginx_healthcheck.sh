#!/bin/bash
echo "===== ПРОВЕРКА NGINX ====="

echo "Проверка наличия nginx:"
if ! which nginx &> /dev/null; then
	echo "ОШИБКА: nginx не найден в системе"
	echo
	echo "ИТОГ: проверка nginx завершилась с ошибкой"
	exit 1
fi

echo "ОК: nginx установлен"

echo

echo "Проверка состояния службы:"
if ! systemctl is-active nginx &> /dev/null; then
	echo "ОШИБКА: служба nginx не активна"
	exit 1
fi
echo "ОК: служба nginx активна"

echo

echo "Проверка авто-запуска:"
if ! systemctl is-enabled nginx > /dev/null 2>&1; then
	echo "ВНИМАНИЕ: nginx не включён в автозапуск"
	echo 
	echo "ИТОГ: nginx работает корректно, автозапуск не включён"
	exit 0
else
	echo "ОК: nginx включён в автозапуск"
	echo 
	echo "ИТОГ: nginx работает корректно"
	exit 0
fi
