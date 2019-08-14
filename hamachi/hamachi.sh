#!/bin/bash
curl -o /home/pi/logmein-hamachi.deb https://www.vpn.net/installers/logmein-hamachi_2.1.0.203-1_armel.deb -L
sudo dpkg -i --force-architecture /home/pi/logmein-hamachi.deb
sudo /etc/init.d/logmein-hamachi start
sleep 4
for ((i=0;i<50;i++))
do
  if sudo hamachi login | grep -E "ok|logged in";
  then
    sleep 1
    break
  else
    echo "Not Active"
  fi
  sleep 1
done
sleep 1
chmod +x /boot/PiBakery/blocks/hamachi/hamachijoin.sh 
/boot/PiBakery/blocks/hamachi/hamachijoin.sh $2
sudo hamachi set-nick "$1"