#!/bin/bash
# Running this script creates SQL output. Output to a file, e.g. test.sql.
# The SQL script creates the tables for the SF100 schema.
# Download the trino CLI and rename the JAR file to trino.
# The file can be run as a CLI, for example 
# /.../cli/trino --user starburst_service  --server=https://10.10.10.10:8443 --file test.sql --password --insecure 
# Given the vanilla install settings, it is possible to get an out of memory issue.
# Increase the following settings on the coordinator and worker
# query.max-memory-per-node=391468kB
### Script runs from here
SCHEMA=sf100
PREFIX=hive.gmtpch
echo 'set session resource_overcommit=true;'
echo 'set session preferred_write_partitioning_min_number_of_partitions=1;'
echo 'set session use_preferred_write_partitioning=true;'
for i in 'lineitem' 'orders' 'customer' 'nation' 'part' 'partsupp' 'region' 'supplier'
	do
		echo 'drop table' $PREFIX$SCHEMA.$i';'
		echo 'create table' $PREFIX$SCHEMA.$i as 'SELECT * from tpch.'$SCHEMA.$i';'
		echo 'analyze' $PREFIX$SCHEMA.$i';'
	done
