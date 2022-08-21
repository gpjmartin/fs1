#!/bin/bash

file=crt02a.sql

export TRINO_PASSWORD=

outfile=out_1993.sql
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf100/g'  -e 's/#YEAR#/1993/g' $file >$outfile
trino --user sa.richard.persaud --password --server=https://sbe-official-demo-google.fieldeng.starburstdata.net --file $outfile --password 

outfile=out_1994.sql
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf100/g'  -e 's/#YEAR#/1994/g' $file >$outfile
trino --user sa.richard.persaud --password --server=https://sbe-official-demo-google.fieldeng.starburstdata.net --file $outfile --password 

outfile=out_1995.sql
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf100/g'  -e 's/#YEAR#/1995/g' $file >$outfile
trino --user sa.richard.persaud --password --server=https://sbe-official-demo-google.fieldeng.starburstdata.net --file $outfile --password 

outfile=out_1996.sql
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf100/g'  -e 's/#YEAR#/1996/g' $file >$outfile
trino --user sa.richard.persaud --password --server=https://sbe-official-demo-google.fieldeng.starburstdata.net --file $outfile --password 

outfile=out_1997.sql
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf100/g'  -e 's/#YEAR#/1997/g' $file >$outfile
trino --user sa.richard.persaud --password --server=https://sbe-official-demo-google.fieldeng.starburstdata.net --file $outfile --password 
