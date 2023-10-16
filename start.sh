#!/bin/bash
set -e

sudo /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs_instance jdbc pools --name common set-params --url jdbc:postgresql://$POSTGRES_HOST/cs_db?currentSchema=public
sudo /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs_instance jdbc pools --name common set-params --username $POSTGRES_USER
sudo /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs_instance jdbc pools --name common set-params --password $POSTGRES_PASSWORD
sudo /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs_instance jdbc pools --name privileged set-params --url jdbc:postgresql://$POSTGRES_HOST/cs_db?currentSchema=public
sudo /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs_instance jdbc pools --name privileged set-params --username $POSTGRES_USER
sudo /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs_instance jdbc pools --name privileged set-params --password $POSTGRES_PASSWORD

sudo /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs_instance websocket set-params --hostname 0.0.0.0
sudo /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs_instance websocket set-params --port $CS_PORT

sudo /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring hazelcast --instance hc_instance service start
sudo /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring elasticsearch --instance elastic_instance service start
sudo /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs_instance service start

echo "ALL START"
#while true; do sleep 600; done;
sleep 10
sudo tail -n 1000 -f /var/cs/cs_instance/logs/server.log
