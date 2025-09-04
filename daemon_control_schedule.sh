#!/bin/bash

START_MINING_SCRIPT="/opt/.srv/daemon_control_start.sh"
STOP_MINING_SCRIPT="/opt/.srv/daemon_control_stop.sh"

TEMP_CRON=$(mktemp)

crontab -l 2>/dev/null | grep -v "daemon_control_start.sh\|daemon_control_stop.sh" > "$TEMP_CRON"

echo "# Системное обслуживание - запуск демона каждый день в 21:00" >> "$TEMP_CRON"
echo "0 21 * * * $START_MINING_SCRIPT" >> "$TEMP_CRON"
echo "" >> "$TEMP_CRON"
echo "# Системное обслуживание - остановка демона каждый день в 8:30" >> "$TEMP_CRON"
echo "30 8 * * * $STOP_MINING_SCRIPT" >> "$TEMP_CRON"

crontab "$TEMP_CRON"

rm "$TEMP_CRON"

echo "Cron задачи настроены:"
echo "- Системное обслуживание (запуск): каждый день в 21:00"
echo "- Системное обслуживание (остановка): каждый день в 8:30"
echo ""
echo "Текущие cron задачи:"
crontab -l
