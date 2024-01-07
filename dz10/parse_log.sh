#!/bin/bash

# Check if script is already running
pidof -o %PPID -x $0 > /dev/null && echo "Script $0 is already running" && exit 1

# Get old and save new last log entry
ldate=$(cat last_date)
awk '{print substr($4,2)}' apache_logs | tail -n 1 > last_date1

# Top clients IPs
echo -e '\nTop clients IPs:'
awk 'substr($4,2) > "'$ldate'" {print $1}' apache_logs | sort | uniq -c | sort -nr | head -n 20

# Top requested URLs
echo -e '\nTop requested URLs:'
awk 'substr($4,2) > "'$ldate'" {print $11}' apache_logs | sort | uniq -c | sort -nr | head -n 20

# HTTP answer codes
echo -e '\nHTTP answer codes:'
awk 'substr($4,2) > "'$ldate'" {print $9}' apache_logs | sort | uniq -c | sort -nr