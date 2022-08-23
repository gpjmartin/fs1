Scripts for TPCH Data generation

Running this script creates SQL output. Output to a file, e.g. ../tpchsf1.sh > test.sql.
# The SQL script creates the tables for the SF100 schema.
# Download the trino CLI and rename the JAR file to trino.
# The file can be run as a CLI, for example 
# /.../cli/trino --user starburst_service  --server=https://10.10.10.10:8443 --file test.sql --password --insecure 
# Given the vanilla install settings, it is possible to get an out of memory issue.
# Increase the following settings on the coordinator and worker
# query.max-memory-per-node=391468kB
# There needs to a schema in place with a matching name, for example:
# create schema hive.gmtpchsf100 WITH (location = 'gs://hsbc-gcs/gmtpchsf100/');
