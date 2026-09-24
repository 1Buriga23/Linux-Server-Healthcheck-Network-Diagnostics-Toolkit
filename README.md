Linux Server Healthcheck & Network Diagnostics Toolkit
Набор Bash-скриптов для базовой диагностики и администрирования Linux-сервера.
Цель проекта
Cоздать простой набор инструментов для проверки состояния Linux-сервера.
Скрипты помогают быстро проверить:
общую информацию о системе;
использование диска;
использование оперативной памяти;
состояние systemd-служб;
наличие и состояние nginx;
базовые ошибки в логах.
Используемые технологии
Linux
Bash
systemd
journalctl
nginx
grep
awk
sed
ip
ss
ping
curl
Структура проекта
linux-admin-toolkit/
├── README.md
├── scripts/
│   ├── system_report.sh
│   ├── check_service.sh
│   ├── disk_check.sh
│   ├── memory_check.sh
│   ├── nginx_healthcheck.sh
│   ├── network_report.sh
│   ├── port_check.sh
│   ├── http_check.sh
│   └── full_healthcheck.sh
├── reports/
│   └── example_report.txt
└── notes/
└── troubleshooting.md
Скрипты
Скрипт	Назначение
system_report.sh	Показывает базовую информацию о системе
check_service.sh	Проверяет, активна ли systemd-служба
disk_check.sh	Проверяет использование диска
memory_check.sh	Проверяет использование оперативной памяти
nginx_healthcheck.sh	Проверяет наличие nginx и состояние службы
full_healthcheck.sh	Запускает все проверки и формирует общий отчёт
network_report.sh	Показывает IP-адреса, маршруты и базовую сетевую диагностику
port_check.sh	Показывает открытые TCP/UDP-порты
http_check.sh	Проверяет HTTP-доступность localhost или переданного URL
Пример результата
Пример результата работы скрипта находится в файле:
reports/example_report.txt
