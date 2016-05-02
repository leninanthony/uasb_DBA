#!/bin/bash
# Script Backup Databases PostgreSQL

BACKUP_DIR="/home/uasb/Documentos/Postgres/Backups/" #Dirección donde se guardaran los backups
FECHA=$(date +%d-%m-%Y_%H:%M:%S)
NOMBRE="backup_musicdb_$FECHA.backup"
USER="postgres"
DB="musicdb"

if [ ! -d $BACKUP_DIR ]; then
mkdir -p $BACKUP_DIR
fi

cd $BACKUP_DIR

if [ -f $NOMBRE]; then
rm $NOMBRE
else
echo "* Generando la copia de seguridad de la BD musicdb"
pg_dump -i -h localhost -p 5432 -U $USER -F c -b -f $NOMBRE.backup $DB
echo " Copia de respaldo de" $DB "finalizada..."
fi

