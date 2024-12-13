#!/bin/bash

BACKUP_DATE=$(date +%H-%M-%S)

mysqldump -u root -p$MYSQL_PASS -h $MYSQL_DB_CONTAINER $MYSQL_DB_NAME > /tmp/backup-db-$BACKUP_DATE.sql
