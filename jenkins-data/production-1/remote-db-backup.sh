#!/bin/bash

BACKUP_DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE_NAME=backup-db-$BACKUP_DATE.sql

mysqldump -u root -p$MYSQL_PASS -h $MYSQL_DB_CONTAINER $MYSQL_DB_NAME > /tmp/$BACKUP_FILE_NAME && \
echo "Uploading the DB backup" && \
aws s3 cp /tmp/$BACKUP_FILE_NAME s3://$AWS_S3_BUCKET_NAME/$BACKUP_FILE_NAME && \
echo "Backup file uploaded"
