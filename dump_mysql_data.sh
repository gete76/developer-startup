#!/bin/sh
#run as root user

mydir=/var/lib/mysql-files/
rm -Rf $mydir*
mysqldump --no-create-info --no-create-db --no-set-names --no-tablespaces \
--skip-add-locks --compatible ansi --skip-comments --skip-quote-names \
--skip-set-charset --skip-triggers --default-character-set utf8 -u mo -pmo \
--tab $mydir mo_development
chown -R postgres:postgres $mydir. 