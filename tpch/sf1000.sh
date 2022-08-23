#!/bin/bash
SCHEMA=sf1000
PREFIX=hive.gmtpch
FORMAT=\'ORC\'
#FORMAT=\'PARQUET\'
TABLE=shipdate
ITERATIONS=4
UNIT=quarter
echo 'set session resource_overcommit=true;'
echo 'set session preferred_write_partitioning_min_number_of_partitions=1;'
echo 'set session use_preferred_write_partitioning=true;'
for i in 'lineitem'
do
	echo -- $i
	echo values \'$i\' ';'
	echo 'drop table if exists' $PREFIX$SCHEMA.$i';'
	echo 'create table' $PREFIX$SCHEMA.$i 'with (format ='$FORMAT') as SELECT * from tpch.'$SCHEMA.$i 'with no data;'
	for j in '1992' '1993' '1994' '1995' '1996' '1997' '1998'
	do
		for ((x = 1 ; x < $ITERATIONS +1 ; x++)); do
		echo 'select current_timestamp;' 
		echo insert into $PREFIX$SCHEMA.$i 'SELECT * from tpch.'$SCHEMA.$i where extract'('year from $TABLE ')' = $j and extract'('$UNIT from $TABLE')' = $x ';'
		done
	done
	echo 'analyze' $PREFIX$SCHEMA'.'$i';'
done
for k in 'orders' 'customer' 'nation' 'part' 'partsupp' 'region' 'supplier'
do
	echo -- $k
	echo values \'$k\' ';'
	echo 'drop table if exists' $PREFIX$SCHEMA.$k';'
	echo 'select current_timestamp;' 
	echo 'create table' $PREFIX$SCHEMA.$k 'with (format = '$FORMAT') as SELECT * from tpch.'$SCHEMA.$k';'
	echo 'analyze' $PREFIX$SCHEMA.$k';'
done
