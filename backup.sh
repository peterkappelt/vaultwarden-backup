#!/bin/sh

SOURCE="/vaultwarden"
TARGET="/backup"

if [ ! -d $SOURCE ] 
then
    echo "Vaultwarden directory ($SOURCE) does not exist!" 
    exit 1
fi

if [ ! -d $TARGET ] 
then
    echo "Backup directory ($TARGET) does not exist!" 
    exit 1
fi

# Backup files, keys and directories
cp $SOURCE/rsa_key.* $TARGET
cp -r $SOURCE/attachments $TARGET
cp -r $SOURCE/sends $TARGET
if [ -f "$SOURCE/config.json" ]; then
    #config doesn't necessarily exist
    cp $SOURCE/config.json $TARGET
fi

#backup sqlite3
sqlite3 $SOURCE/db.sqlite3 ".backup '$TARGET/db.sqlite3'"

date +"%Y-%m-%dT%H:%M:%S%z" > $TARGET/last_backup