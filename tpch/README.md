# Scripts for TPC-H Data generation

Running this script creates SQL output. Output to a file, e.g. ../sf100.sh > test.sql.

The SQL script creates the tables based on the SFXXX Schemas in Starburst - e.g. SF100, SF1000, etc.

There needs to be a schema in place with a matching name in the scripts, for example:

create schema hive.XXXXXsf100 WITH (location = 'gs://your_gcs_storage/XXXXXsf100/');

The scripts append the Schema name to the prefix of the location above. 
For ease of use, create a schema that ends with the TPCH schema - "sf100" in the above example. 
In the above you would define the PREFIX variable as PREFIX=hive.XXXXX.

Download the trino CLI and rename the JAR file to trino.

https://trino.io/docs/current/client/cli.html

The output SQL file (e.g. test.sql from the script output) can be input to the trino CLI, for example: 

/.../cli/trino --user starburst_service  --server=https://10.10.10.10:8443 --file test.sql --password --insecure 

The above command will prompt you for a password.

Given the vanilla install settings, it is possible to get an out of memory issue.
Increase the following settings on the coordinator and worker, and push the configs using starburst admin commands.

jvm.config.j2: </br>
-Xmx48G </br>
-Xms48G

config.properties.j2:</br>
query.max-memory-per-node=32GB

The above assumes you have >= 64GB of memory on the coordinator and workers.

## Scripts Files:</br>
**sf100.sh** - Uses the TPCH.SF100 Schema, and uses a CREATE TABLE XXX AS SELECT syntax to create the 8 x TPC-H Tables on Object Storage (e.g. GCS, ORC Format). </br>
Approx 120GB of data is read from the TPC-H Tables. LINEITEM is 85GB at source.</br>

**sf100_v2.sh** - Same as above, but creates the LINEITEM Table empty, and then INSERTS each year one at a time. There is data from years 1992 to 1998 inclusive in TPC-H. The INSERTS filter on those years, one year at a time. </br>
All other tables are created using a CREATE TABLE XXX AS SELECT syntax (just one operation). </br>
Approx 120GB of data is read from the TPCH Tables. LINEITEM is 85GB at source.</br>

**sf1000.sh** - Uses the TPCH.SF1000 Schema. The LINEITEM Table is created empty, and data is INSERTED. The INSERTS are filtered on year and another unit - quarter by default. This creates 28 splits (7 years x 4 quarters).  </br>
All other tables are created using a CREATE TABLE XXX AS SELECT syntax (just one operation). </br>
Approx 1.2TB of data is read from the TPCH Tables. LINEITEM is ~850GB at source.</br>

**Note:** The sf10000 schema can be set in the parameter section in the sf1000.sh script also. This will read approx 12TB of data from the SF10000 schema to generate the data on Object Storage.</br>


## File Formats:

The scripts (other than sf100.sh) provide an option to define the file format - e.g. ORC or Parquet.
This is defined in the CREATE TABLE docs below. Keep in mind, creating a table in the DELTA and ICEBERG schemas, will automatically create files in those respective formats.

https://docs.starburst.io/latest/sql/create-table.html
