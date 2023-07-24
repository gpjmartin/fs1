#!/bin/bash
#This script is expecting a sql file - sql_part.txt
#The file should have a SQL statement on each line, ending with a ';'
ITERATIONS=1
for ((x = 1 ; x < $ITERATIONS +1 ; x++)); 
do
#nohup /Users/grahammartin/Documents/cli/402/trino --server http://localhost:8080 --user=starburst_service -f sql.txt --output-format=csv  --progress &
#/Users/grahammartin/Documents/cli/402/trino --server http://localhost:8080 --user=admin -f sql.txt --output-format=json  --progress 
#/Users/grahammartin/Documents/cli/402/trino --server https://xxx.starburstdata.net:8080 --user=starburst_service --password -f sql.txt --output-format=csv  --progress 
#sleep 10
#/Users/grahammartin/Documents/cli/402/trino --server https://xxx.starburstdata.net:8080 --user=gm --password -f sql.txt --output-format=null  --progress 
#/Users/grahammartin/Documents/cli/422/trino --server https://xxx.trino.galaxy.starburst.io:443 --user=gm@starburst.io/accountadmin --password -f sql.txt --output-format=null  --progress
#/Users/grahammartin/Documents/cli/422/trino --server https://xxx.trino.galaxy.starburst.io:443 --user=gm@starburst.io/accountadmin --password --output-format=csv --execute 'SELECT * FROM "gms3"."land"."page_views" T where T."country" IS NOT NULL'
#/Users/grahammartin/Documents/cli/422/trino --server https://xxx.trino.galaxy.starburst.io:443 --user=gm@starburst.io/accountadmin --password --output-format=csv --execute 'SELECT ds FROM "gms3"."land"."page_views" T where T."country" = '\'ESP\'' '
/Users/grahammartin/Documents/cli/422/trino --server https://xxx.trino.galaxy.starburst.io:443 --user=graham.martin@starburst.io/accountadmin --password --ignore-errors --output-format=csv  -f sql_part.txt 
done 