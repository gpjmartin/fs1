Scripts for the Iceberg and PARQUET File formats.

Running this script creates SQL output. Output to a file, e.g. ../lakeformats.sh > test.sql.

The SQL script creates the tables based on the SFXXX Schemas in Starburst - e.g. SF100, SF1000, etc.

There needs to be a schema in place with a matching name in the scripts, for example:

create schema iceberg.XXXXXsf100 WITH (location = 'gs://your_gcs_storage/XXXXXsf100/');
create schema delta.XXXXXsf100 WITH (location = 'gs://your_gcs_storage/XXXXXsf100/');

The scripts append the Schema name to the prefix of the location above. For ease of use, create a schema that ends with the TPCH schema - "sf100" in the above example. In the above you would define the PREFIX variable as PREFIX=delta.XXXXX or iceberg.XXXXX

Download the trino CLI and rename the JAR file to trino.

https://trino.io/docs/current/client/cli.html

The output SQL file (e.g. test.sql from the script output) can be input to the trino CLI, for example:

/.../cli/trino --user starburst_service --server=https://10.10.10.10:8443 --file test.sql --password --insecure

The above command will prompt you for a password.

Note:

The above is using the TPC-H to generate the data. 
An alternative approach is to use the Hive ORC files, for example:

create table iceberg.icebergtpchsf100.lineitemhiveorcctas with (format = 'PARQUET') as SELECT * from hive.gmtpchsf100.lineitem

create table delta.deltatpchsf100.lineitemhiveorcctasdelta  as SELECT * from hive.gmtpchsf100.lineitem

In some basic tests, the above were 20-30% faster over creating directly from the TPC-H Data.


For reference:

https://docs.starburst.io/latest/sql/create-table.html
