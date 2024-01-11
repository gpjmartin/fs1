#!/bin/bash
date
export TRINO_PASSWORD='abc123'
ITERATIONS=1
for ((x = 1 ; x < $ITERATIONS +1 ; x++)); 
do
#/Users/grahammartin/Documents/cli/422/trino --server https://XXXX.trino.galaxy.starburst.io:443 --user=user@starburst.io/accountadmin --password -f sql.txt --output-format=csv  --progress
#/Users/grahammartin/Documents/cli/422/trino --server https://XXXX.trino.galaxy.starburst.io:443 --user=user@starburst.io/accountadmin --password --output-format=csv --execute 'SELECT * FROM "gms3"."land"."page_views" T where T."country" IS NOT NULL'
#/Users/grahammartin/Documents/cli/422/trino --server https://XXXX.trino.galaxy.starburst.io:443 --user=user@starburst.io/accountadmin --password --output-format=csv --execute 'SELECT ds FROM "gms3"."land"."page_views" T where T."country" = '\'ESP\'' '
#/Users/grahammartin/Documents/cli/422/trino --server https://XXXX.trino.galaxy.starburst.io:443 --user=user@starburst.io/accountadmin --password --ignore-errors --output-format=csv  -f sql_part.txt 
#echo 'SELECT ds FROM "gms3"."land"."page_views" T where T."country" = '\'ESP\'' '
done 
##/Users/grahammartin/Documents/cli/422/trino --server https://gmartin-gmeuwest2.trino.galaxy.starburst.io:443 --user=graham.martin@starburst.io/accountadmin --password --output-format=null --execute 'SELECT * FROM "gms3"."land"."page_views" where ds='2023-01-01' and country='ESP''
date
