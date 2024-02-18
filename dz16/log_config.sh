#!/bin/bash

#/etc/rsyslog.conf
# Remote logs
#$template RemoteLogs,"/var/log/rsyslog/%HOSTNAME%/%PROGRAMNAME%.log"
#*.* ?RemoteLogs
#& ~


## Installing auditd with enabled tcp listener
# Enable deb-src in /etc/apt/sources.list
#sudo apt-get update
#sudo apt-get install build-essential
#mkdir audit && cd audit
#apt-get source audit
#sudo apt-get build-dep audit
#cd audit-...
#nano debian/rules # find and remove '-disable-listener' option
#sudo dpkg-buildpackage -b
#cd ..
#sudo dpkg -i auditd_...