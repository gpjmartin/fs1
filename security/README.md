Step 1: Add a File Access Control file

Add the file access-contol.properties (see in this folder) to the ../extra/etc/ folder. </br>
That files points to a rules.json file. An example is provided in this folder. </br>


Step 2: Add a rules.json

Take the rules.json file provided in this folder and copy it to the ../extra/etc folder</br>


Step 3: Edit the rules.json

In the rules.json - add in the admins to the top level privileges (e.g. starburst_service, etc.).</br>

Push the config updates. Restart the cluster for the changes to take effect. </br>

Use another user (not one of the admins) to test:</br>

1. Column Level Access Control

The table "tpch"."tiny"."customer" will not provide access to a non-admin user for the "address" column.</br>

For example, the below should have access:</br>

      SELECT custkey,name,nationkey,mktsegment,acctbal,comment FROM "tpch"."tiny"."customer" LIMIT 10;</br>

But not:</br>

      SELECT * FROM "tpch"."tiny"."customer" LIMIT 10;</br>

2. Column Masking

Any non-admin whom tries to access "acctbal" column will see the values masked.</br>

3. Row Level Access

Run the following SQL to create a Table (in a catalog of your choice):</br>

Note: The Table "hive"."gmtpchtiny"."user1" is used here, and is also the one named in the rules.json file.</br>
Change the strings 'graham' and 'martin' below, to your test non-admin users.</br>

Changes to the rules.json are effective immediately, and don't require the cluster to be re-started.</br>

      drop table hive.gmtpchtiny.user1

      CREATE TABLE hive.gmtpchtiny.user1 (
         user varchar(25), 
         suppkey bigint,
         name varchar(25),
         address varchar(40),
         nationkey bigint,
         phone varchar(15),
         acctbal double,
         comment varchar(101)
      )

      INSERT INTO hive.gmtpchtiny.user1 
      SELECT 'graham',
         suppkey,
         name,
         address,
         nationkey,
         phone,
         acctbal,
         comment 
      from tpch.tiny.supplier limit 10

      INSERT INTO hive.gmtpchtiny.user1 
      SELECT 'martin',
         suppkey,
         name,
         address,
         nationkey,
         phone,
         acctbal,
         comment 
      from tpch.tiny.supplier limit 10

Using a non-admin user, test the row-level access:</br>

select * from hive.gmtpchtiny.user1 

Should return only the values for the logged in user (assuming the "user" column contains that value).</br>


