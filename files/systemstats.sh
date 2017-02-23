#!/bin/bash
#
# Server Status Script
# Version 0.1.3 m
# Updated: July 26th 2011 m

CPUTIME=$(ps -eo pcpu | awk 'NR>1' | awk '{tot=tot+$1} END {print tot}')
CPUCORES=$(cat /proc/cpuinfo | grep -c processor)
UP=$(echo `uptime` | awk '{ print $3 " " $4 }')
let DISK_TOTAL=`df / | awk '{ a = $2 } END { print a }'`
let DISK_FREE=`df / | awk '{ a = $4 } END { print a }'`
DISK_TOTAL_H=`df -h / | awk '{ a = $2 } END { print a }'`
DISK_FREE_H=`df -h / | awk '{ a = $4 } END { print a }'`
DISK_PERC=`bc <<< "scale=1 ; $DISK_FREE * 100 / $DISK_TOTAL"`
echo "
# Welcome to `hostname`

This system is deployed with Ansible, DO NOT make manual system modifications
Technical contacts: cristi@eaudeweb, drupal@eaudeweb.ro, noc@eaudeweb.ro

# System status
Updated: `date`

- Server Name               = `hostname`
- Public IP                 = `dig +short myip.opendns.com @resolver1.opendns.com`
- OS Version                = `cat /etc/redhat-release`
- Load Averages             = `cat /proc/loadavg`
- System Uptime             = `echo $UP`
- Platform Data             = `uname -orpi`
- CPU Usage (average)       = `echo $CPUTIME / $CPUCORES | bc`%
- Memory free (real)        = `free -m | head -n 2 | tail -n 1 | awk {'print $4'}` Mb
- Memory free (cache)       = `free -m | head -n 3 | tail -n 1 | awk {'print $3'}` Mb
- Swap in use               = `free -m | tail -n 1 | awk {'print $3'}` Mb
- Disk Usage                = Free $DISK_FREE_H of $DISK_TOTAL_H ($DISK_PERC %)
" > /etc/motd
