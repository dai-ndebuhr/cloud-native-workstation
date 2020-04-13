#!/usr/bin/env bash

count=0
echo "Waiting for keycloak server to start..."
while true
do
  if [ $count -le 120 ]; then
    wget --spider -q http://keycloak:8080
    if [ $? -ne 0 ] ;then
      echo "waiting $count"
      sleep 5
      count=$(( count+1 ))
    else
      echo "Website is up"
      sleep 10
      /opt/server.sh
      /opt/component.sh code 3000
      /opt/component.sh hugo 1313
      /opt/component.sh hackmd 3003
      /opt/component.sh kdenlive-desktop 6901
      /opt/component.sh kdenlive-audio 8090
      /opt/component.sh selenium 4444
      /opt/component.sh chrome 6080
      /opt/component.sh jupyter 8888
      /opt/component.sh landing 443
      break
    fi
  else
    echo "Timeout exceeded...giving up waiting for keycloak"
    exit 1
  fi
done


