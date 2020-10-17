#!bin/bash

mysqldump -u "jemmyperez" -h "jemmyperez.mysql.pythonanywhere-services.com" --set-gtid-purged=OFF 'jemmyperez$torneo'  < backup.sql
