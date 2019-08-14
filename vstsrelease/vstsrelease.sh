#!/bin/bash
if [ $# -lt 4 ]; then
    exit 1
fi
hostname=$(ip link show wlan0 | awk '/ether/ {gsub(":","",$2); print $2}')
url="$2"
deploy="$3"
project="$4"
token="$1"
curl -A 'PiBakery' -o /home/pi/vsts-agent-linux-arm-2.155.1.tar.gz https://vstsagentpackage.azureedge.net/agent/2.155.1/vsts-agent-linux-arm-2.155.1.tar.gz -L
mkdir /home/pi/myagent && cd /home/pi/myagent
tar zxvf /home/pi/vsts-agent-linux-arm-2.155.1.tar.gz
cd /home/pi/myagent/
./config.sh --unattended --url "$url" --auth pat --token "$token" --agent "$hostname" --acceptTeeEula --deploymentgroup --deploymentgroupname "$deploy" --runasservice --projectname "$project"
sudo ./svc.sh install
sudo ./svc.sh start
