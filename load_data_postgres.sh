#!/bin/sh
#run as postgres user
#rebuild schema
port=5432
host=localhost 
user=mo
export PGPASSWORD=mo 
psql -U $user -h $host -p $port mo_development < schema.sql 
#using mysql tab delimited table dump format
datadir='/var/lib/mysql-files/'
for filename in $datadir*.txt; do
    echo "importing $filename..."
    #replace hidden returns for literal return strings
    #patch bad utf8 characters in a few records.
    sed -i 's/\r/\\r/g;s/\\0//g' $filename
    #patch bad date standards in mysql, set 0000 year to 1970 (epoch). Need perl for look ahead/behind regex
    perl -pi.bak -e 's/(?<=\s)0000(?=\-[0-1][0-9]\-[0-3][0-9]\s)/1970/g' $filename
    tbname=$(basename $filename .txt)
    #copy in from local file
    psql -U $user -h $host -p $port -c "\copy $tbname FROM '$filename'" mo_development
    #set the tables next sequence value for the primary key
    #NOTE: this will fail if the table doesn't have an 'id' column, which is fine
    #it just means it doesn't have a primary key with an associated sequence to update.
    psql -U $user -h $host -p $port -c "SELECT setval('${tbname}_id_seq', COALESCE((SELECT MAX(id)+1 FROM $tbname), 1), false)" mo_development
done