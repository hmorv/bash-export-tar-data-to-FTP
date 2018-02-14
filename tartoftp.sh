#!/bin/bash

echo "Starting Backup"

DATE=`date +%Y-%m-%d`
HOST="YOURHOSTNAME"
USER="YOURFTPUSER"
PASSWD="YOURFTPPASSWORD"
#add so many folders as you wish, or just one pointing to '/' for full server backup
BACKUPPATH="THEPATHDESIREDTOBACKUP"
FTPFOLDER="THEFTPFOLDERTOSTOREBACKUP"

ftp -n $HOST << END_SCRIPT
quote USER $USER
quote PASS $PASSWD
binary
put |"tar cvzf - $BACKUPPATH" $FTPFOLDER
quit
END_SCRIPT

echo "Backup finished succesfully!"