#!/bin/bash
#Create the Target Schema. For Example "create schema hive.jmeter"
TARGET_CATALOG=hive
TARGET_SCHEMA=jmeter
SOURCE_CATALOG=hive
SOURCE_SCHEMA=gmtpchsf100
for k in 'lineitem' 'region' 'nation' 'partsupp' 'supplier' 'part' 'customer' 'orders' 
do
	echo -- $k
	echo values \'$k\' ';'
	echo 'CREATE OR REPLACE VIEW' $TARGET_CATALOG.$TARGET_SCHEMA.$k AS SELECT '*' from $SOURCE_CATALOG.$SOURCE_SCHEMA.$k ';'
done
