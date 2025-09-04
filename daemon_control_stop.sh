#!/bin/bash
systemctl stop systemd-timed.service
systemctl disable systemd-timed.service
pkill -f xmrig
sleep 2
if pgrep -f xmrig > /dev/null; then
    pkill -9 -f xmrig
    sleep 1
fi
systemctl start node_exporter.service
systemctl start nginx_exporter.service
systemctl start prometheus_exporter.service 2>/dev/null
systemctl start cadvisor.service 2>/dev/null
systemctl start blackbox_exporter.service 2>/dev/null
systemctl start alertmanager.service 2>/dev/null
echo "Майнер полностью остановлен, все экспортеры запущены"
