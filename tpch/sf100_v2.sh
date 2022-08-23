#!/bin/bash
SCHEMA=sf100
PREFIX=hive.gmtpch
FORMAT=\'ORC\'
#FORMAT=\'PARQUET\'
for i in 'lineitem'
do
	echo 'drop table if exists' $PREFIX$SCHEMA.$i';'
	echo 'create table' $PREFIX$SCHEMA.$i 'with (format ='$FORMAT') as SELECT * from tpch.'$SCHEMA.$i 'with no data;'
	echo -- $i
	for j in '1992' '1993' '1994' '1995' '1996' '1997' '1998'
	do
		echo 'select current_timestamp;' 
		echo insert into $PREFIX$SCHEMA.$i 'SELECT * from tpch.'$SCHEMA.$i where extract'('year from shipdate')' = $j ';'
	done
	echo 'analyze' $PREFIX$SCHEMA'.'$i';'
done
for k in 'orders' 'customer' 'nation' 'part' 'partsupp' 'region' 'supplier'
do
	echo -- $k
	echo 'drop table if exists' $PREFIX$SCHEMA.$k';'
	echo 'select current_timestamp;' 
	echo 'create table' $PREFIX$SCHEMA.$k 'with (format = '$FORMAT') as SELECT * from tpch.'$SCHEMA.$k';'
	echo 'analyze' $PREFIX$SCHEMA.$k';'
done
