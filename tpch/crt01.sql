-- Example names 
--CREATE SCHEMA hive.tpchtsf1000
--WITH (location = 'gs://official-demo-gcp/tpchtsf1000')
--
-- sed exampe
--
-- file=crt01.sql
-- outfile=out_1997.sql
-- sed -e 's/#CAT01#/hive/g'   -e 's/#SCH01#/tpcht/g'  -e 's/#SIZE#/sf300/g'  $file >$outfile
-- trino --user richard  --server=https://10.1.1.1:8443 --file $outfile --password




-- schema 01 contains all the tables
create schema #CAT01#.#SCH01##SIZE# with ( location = '#LOC01#');
-- schema 02 contains all the views for 
create schema #CAT02#.#SCH02##SIZE# with ( location ='#LOC01#');



