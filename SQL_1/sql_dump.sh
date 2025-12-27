#!/bin/bash

# Settings
BACKUP_DIR="/home/jrdeath/Dmitriy_Petrovich/SQL_1/dumps/"
DB_NAME="tms"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_${DATE}.sql"

# Check directory
mkdir -p $BACKUP_DIR

# dump with error hendling
pg_dump -U dump_client -h localhost $DB_NAME > $BACKUP_FILE 2>&1

# successful check
if [ $? -eq 0 ]; then
    echo "$(date): Backup successful: $BACKUP_FILE" >> /home/jrdeath/Dmitriy_Petrovich/SQL_1/logs/tms_dump.log    
    gzip $BACKUP_FILE
else
    echo "$(date): Backup FAILED" >> /home/jrdeath/Dmitriy_Petrovich/SQL_1/logs/tms_dump.log
    exit 1
fi

# Delete old dumps (save dump 30 days)
find $BACKUP_DIR -name "*.sql.gz" -mtime +30 -delete
