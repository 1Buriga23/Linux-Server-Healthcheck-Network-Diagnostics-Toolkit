#!/bin/bash

echo "===== SYSTEM REPORT ====="
echo

echo -e "User:\n\t$(whoami)\n" #вывод текущего пользователя в системе

echo -e "Hostname:\n\t$(hostname)\n" #вывод имени хоста

echo -e "Uptime:\n\t$(uptime)\n" #вывод времени работы системы и средняя нагрузка на неё

echo -e "Disk usage for /:\n$(df / -h)\n" # показать использование корневого раздела

echo -e "Memory usage:\n$(free -h)\n" # использование оперативной памяти

