Scripts for TPCH Data generation

Running this script creates SQL output. Output to a file, e.g. ../sf100.sh > test.sql.

The SQL script creates the tables based on the SF100 schema in Starburst.

Download the trino CLI and rename the JAR file to trino.

https://trino.io/docs/current/client/cli.html

The output SQL file can be run as a CLI, for example 

/.../cli/trino --user starburst_service  --server=https://10.10.10.10:8443 --file test.sql --password --insecure 

Given the vanilla install settings, it is possible to get an out of memory issue.
Increase the following settings on the coordinator and worker
# query.max-memory-per-node=391468kB
# There needs to a schema in place with a matching name, for example:
# create schema hive.gmtpchsf100 WITH (location = 'gs://your_gcs_storage/gmtpchsf100/');
