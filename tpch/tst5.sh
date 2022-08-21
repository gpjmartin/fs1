#!/bin/bash

file=in3c.sql
export TRINO_PASSWORD=xxxxxx

outfile=out_1993.sql
#sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1993/g' -e 's/#M1#/1/g' -e 's/#M2#/2/g'  $file >$outfile
#trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
#sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1993/g' -e 's/#M1#/3/g' -e 's/#M2#/4/g'  $file >$outfile
#trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
#sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1993/g' -e 's/#M1#/5/g' -e 's/#M2#/6/g'  $file >$outfile
#trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
#sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1993/g' -e 's/#M1#/7/g' -e 's/#M2#/8/g'  $file >$outfile
#trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1993/g' -e 's/#M1#/9/g' -e 's/#M2#/10/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1993/g' -e 's/#M1#/11/g' -e 's/#M2#/12/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 


outfile=out_1994.sql
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1994/g' -e 's/#M1#/1/g' -e 's/#M2#/2/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1994/g' -e 's/#M1#/3/g' -e 's/#M2#/4/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1994/g' -e 's/#M1#/5/g' -e 's/#M2#/6/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1994/g' -e 's/#M1#/7/g' -e 's/#M2#/8/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1994/g' -e 's/#M1#/9/g' -e 's/#M2#/10/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1994/g' -e 's/#M1#/11/g' -e 's/#M2#/12/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 

outfile=out_1995.sql
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1995/g' -e 's/#M1#/1/g' -e 's/#M2#/2/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1995/g' -e 's/#M1#/3/g' -e 's/#M2#/4/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1995/g' -e 's/#M1#/5/g' -e 's/#M2#/6/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1995/g' -e 's/#M1#/7/g' -e 's/#M2#/8/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1995/g' -e 's/#M1#/9/g' -e 's/#M2#/10/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1995/g' -e 's/#M1#/11/g' -e 's/#M2#/12/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 

outfile=out_1996.sql
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1996/g' -e 's/#M1#/1/g' -e 's/#M2#/2/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1996/g' -e 's/#M1#/3/g' -e 's/#M2#/4/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1996/g' -e 's/#M1#/5/g' -e 's/#M2#/6/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1996/g' -e 's/#M1#/7/g' -e 's/#M2#/8/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1996/g' -e 's/#M1#/9/g' -e 's/#M2#/10/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1996/g' -e 's/#M1#/11/g' -e 's/#M2#/12/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 

outfile=out_1997.sql
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1997/g' -e 's/#M1#/1/g' -e 's/#M2#/2/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1997/g' -e 's/#M1#/3/g' -e 's/#M2#/4/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1997/g' -e 's/#M1#/5/g' -e 's/#M2#/6/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1997/g' -e 's/#M1#/7/g' -e 's/#M2#/8/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1997/g' -e 's/#M1#/9/g' -e 's/#M2#/10/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 
sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf1000/g'  -e 's/#YEAR#/1997/g' -e 's/#M1#/11/g' -e 's/#M2#/12/g'  $file >$outfile
trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password  --insecure 

