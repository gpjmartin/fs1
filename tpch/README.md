# Scripts for TPCH Data generation

Running this script creates SQL output. Output to a file, e.g. ../sf100.sh > test.sql.

The SQL script creates the tables based on the SF100 schema in Starburst.

There needs to a schema in place with a matching name, for example:

create schema hive.gmtpchsf100 WITH (location = 'gs://your_gcs_storage/gmtpchsf100/');

Download the trino CLI and rename the JAR file to trino.

https://trino.io/docs/current/client/cli.html

The output SQL file can be run as a CLI, for example 

/.../cli/trino --user starburst_service  --server=https://10.10.10.10:8443 --file test.sql --password --insecure 

Given the vanilla install settings, it is possible to get an out of memory issue.
Increase the following settings on the coordinator and worker

jvm.config.j2:
-Xmx48G
-Xms48G

config.properties.j2:
query.max-memory-per-node=32GB

The above assumes you have >> 64GB of memory on the coordinator and workers.

Scripts Files:</br>
**sf100.sh** - Uses the TPCH.SF100 Schema, and does a CREATE TABLE AS SELECT syntax to create the 8 x TPCH Tables on GCS (ORC Format). Approx 120GB of data is read from the TPCH Tables. LINEITEM is 85GB at source.</br>

**sf100_v2.sh** - Same as above, but creates the LINEITEM Table empty, and then INSERTS each year one at a time. There is data from years 1992 to 1998 inclusive. The INSERTS filter on those years. All other tables are created using a CREATE TABLE AS SELECT syntax (just one operation). Approx 120GB of data is read from the TPCH Tables. LINEITEM is 85GB at source.</br>

**sf1000.sh** - Uses the TPCH.SF100 Schema. The LINEITEM Table is created empty, and data is INSERTED. The INSERTS are filtered on year and another unit - quarter by default. This creates 28 splits (7 years x 4 quarters).  </br>
