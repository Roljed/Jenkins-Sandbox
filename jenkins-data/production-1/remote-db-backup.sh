#!/bin/bash

set -e

BACKUP_DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE_NAME=backup-db-$BACKUP_DATE.sql

source /tmp/envfile

echo "Starting database backup..."
if mysqldump -u root -p"$MYSQL_PASS" -h "$MYSQL_DB_CONTAINER" "$MYSQL_DB_NAME" > /tmp/$BACKUP_FILE_NAME; then
    echo "Database backup created: /tmp/$BACKUP_FILE_NAME"
else
    echo "Error creating database backup" >&2
    exit 1
fi

echo "Uploading backup to S3..."
if aws s3 cp /tmp/$BACKUP_FILE_NAME s3://"$AWS_S3_BUCKET_NAME"/"$BACKUP_FILE_NAME"; then
    echo "Backup successfully uploaded to S3"
else
    echo "Error uploading backup to S3" >&2
    exit 1
fi
