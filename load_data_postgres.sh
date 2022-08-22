#!/bin/sh
#run as postgres user
#rebuild schema
psql mo_development < schema.sql 
#using mysql tab delimited table dump format
datadir='/var/lib/mysql-files/'
for filename in $datadir*.txt; do
    echo "importing $filename..."
    #replace hidden returns for literal return strings
    sed -i 's/\r/\\r/g' $filename
    #patch bad date standards in mysql
    perl -pi.bak -e 's/(?<=\s)0000(?=\-[0-1][0-9]\-[0-2][0-9]\s)/1970/g' $filename
    tbname=$(basename $filename .txt)
    #copy in from local file
    psql -c "\copy $tbname FROM '$filename'" mo_development
    #set the tables next sequence value for the primary key
    psql -c "SELECT setval('${tbname}_id_seq', COALESCE((SELECT MAX(id)+1 FROM $tbname), 1), false)" mo_development
done