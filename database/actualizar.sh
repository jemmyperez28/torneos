#!bin/bash
sed -i backup.sql -e 's/utf8mb4_0900_ai_ci/utf8mb4_unicode_ci/g'
mysql -u "jemmyperez" -h "jemmyperez.mysql.pythonanywhere-services.com"  'jemmyperez$torneo'  < backup.sql
