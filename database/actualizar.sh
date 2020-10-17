#!bin/bash

mysql -u "jemmyperez" -h "jemmyperez.mysql.pythonanywhere-services.com"  'jemmyperez$torneo'  < backup.sql
