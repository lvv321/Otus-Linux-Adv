#!/bin/bash

#client side
borg init --encryption=repokey borg@192.168.56.11:/var/backup/

#test backup
#borg create --stats --list borg@192.168.56.11:/var/backup/::"etc-{now:%Y-%m-%d_%H:%M:%S}" /etc

#list backups
#borg list borg@192.168.56.11:/var/backup