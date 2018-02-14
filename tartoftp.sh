#!/bin/bash

echo "Starting Backup"

FECHA=`date +%Y-%m-%d`
HOST='YOURHOSTNAME'
USER='YOURFTPUSER'
PASSWD='YOURFTPPASSWORD'
BACKUPPATH='THEPATHDESIREDTOBACKUP'

ftp -n $HOST << END_SCRIPT
quote USER $USER
quote PASS $PASSWD
binary
put |"tar cvzf - $BACKUPPATH" ./backups/tomcat/backup-$FECHA.tar.gz
quit
END_SCRIPT

echo "Backup finished succesfully!"