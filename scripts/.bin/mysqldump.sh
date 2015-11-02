#!/bin/bash

## Jimi's MySQL database dump script

#Variables
SQL=/home/james/SQL/
OLD=`/bin/date -d "-2 weeks" +%Y%m%d`
NEW=`/bin/date +%Y%m%d`

#Databases to dump
databases=( outgrabe perryart etp merryjapes one4five jamesperry onefivec_perryart)
# Remember to add "dump" user to new databases!!!
# grant select, lock tables on dbname.* to 'dump'@'localhost' identified by 'dump';

##### Backup Script - Do not edit beyond this line #####

for database in ${databases[@]}
do
	# Dump with new date
	echo Dumping $database..
	mysqldump -udump -pdump $database > $SQL$database/$NEW-$database.sql
	echo done.

	# Remove old backup
	echo Removing old $database dumps..
	if [ -f $SQL$database/$OLD-$database.sql ]
	then
	  rm $SQL$database/$OLD-$database.sql
	fi
	echo done.
done
echo Completed successfully.
