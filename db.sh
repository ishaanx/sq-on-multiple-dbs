#!/bin/bash

###VARIABLES
DB1='database_1'
DB2='database_2'
db_host_name='example.com'
db_username='example_user'

###Remove the output file if exists
rm -f op.tsv

echo "$DB1"
echo "$DB1" >> op.tsv ###Print the schema name
mysql -n --column-names --delimiter=";"  -h $db_host_name -u $db_username -p$db_password -D $DB1 < source.sql | sed 's/\t/,/g' >> op.tsv


echo "$DB2"
echo "$DB2" >> op.tsv ###Print the schema name
mysql -n --column-names --delimiter=";"  -h $db_host_name -u $db_username -p$db_password -D $DB2 < source.sql | sed 's/\t/,/g' >> op.tsv


###Following command uses a custom script called "f2s" which sends the op.tsv file to Slack Channel
#bash f2s -c "channel_name" -f "op.tsv" -m "SQL" -x "database_output" -n "" -s "<slack_api_token>" > /dev/null
