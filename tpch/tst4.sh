#!/bin/bash

file=in3a.sql
export TRINO_PASSWORD=StarburstR0cks!

outfile=out_1993.sql
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1993/g' $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 

file=in3b.sql

outfile=out_1994.sql
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1994/g' $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 

outfile=out_1995.sql
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1995/g' $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 

outfile=out_1996.sql
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1996/g' $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 

outfile=out_1997.sql
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1997/g' $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
