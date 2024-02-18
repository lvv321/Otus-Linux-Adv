#!/bin/bash

sudo apt-get update
sudo apt-get -y install nginx auditd audispd-plugins

#/etc/nginx/nginx.conf
#access_log syslog:server=192.168.56.12:514,tag=nginx_access,severity=info combined;
#error_log /var/log/nginx/error.log;
#error_log syslog:server=192.168.56.12:514,tag=nginx_error;

#/etc/audit/rules.d/audit.rules
#-w /etc/nginx/nginx.conf -p wa -k nginx_conf
#-w /etc/nginx/default.d/ -p wa -k nginx_conf
