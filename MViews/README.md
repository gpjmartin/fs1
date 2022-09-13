Step 1: Download and unzip the Cache tarball file: </br>

https://s3.us-east-2.amazonaws.com/software.starburstdata.net/380e/380-e.3/starburst-cache-service-380-e.3.tar.gz

Download and untar. Move to /opt.

Step 2: Cache Service

Update the Cluster Config with the cache service details. </br>
Create a file in ../extra/etc called cache.properties and add the below:

    service-database.user=postgres 
    service-database.password=PASSWORD_HERE 
    service-database.jdbc-url=jdbc:postgresql://<postgre-db-hostname>:5432/cache_service 
        
    starburst.user=cache-service 
    starburst.jdbc-url=jdbc:trino://192.168.0.2:8080 
  
    http-server.http.port=8180

Push the configs out using ansible. </br>
After re-cycling the cluster, the new schemas under the cache_service database should appear.
   
Step 3: Hive Config

    connector.name=hive
    ...
    cache-service.uri=http://192.168.0.2:8180
    materialized-views.enabled=true
    materialized-views.namespace=mv_namespace
    materialized-views.storage-schema=mv_storage
    
In the above example, you need to create the schemas - mv_namespace and mv_storage. </br>
The mv_storage is where the physical Materialized Views will be persisted in Hive.

Step 4: Create Materialized View's Schemas

CREATE SCHEMA hive.mf_mv_storage
WITH (location = 'gs://gcs-bucket/mv_storage/')

Step 5: Create a Materialized View

    CREATE OR REPLACE MATERIALIZED VIEW hive.test.test_mat_view
    WITH (
         max_import_duration = '1m'
         refresh_interval = '5m'
         grace_period = '10m'
         )
    AS
    SELECT * FROM tpch.tiny.lineitem

REFRESH MATERIALIZED VIEW hive.test.test_mat_view

Step 6: Add a File Access Control file

Add the file access-contol.properties (see in this folder) to the ../extra/etc/ folder. </br>
That files points to a rules.json file. An example is provided in this folder. </br>
Add the file to the ../extra/etc folder, and edit to add all of the catalogs so the cache-service user has access. </br>
Push the config updates. Restart the cluster for the changes to take effect. </br>

Step 7: Add Materialized Views on HDFS

The following Queries are ideal candidates to create Materialized Views on HDFS: </br>

    Q5 - SF100
    Q5 - SF1000
    Q21 - SF100
    Q21 - SF1000

The queries should be defined against Big Query - so the Materialized View is avoiding the need to hit Big Query.</br>
An example of running the Q21 - SF1000 Materialized View: </br>

    CREATE MATERIALIZED VIEW hive.hive.materialized_views.gbq_mv_q21_sf100
    WITH (
      grace_period = '10m',
      refresh_interval = '600m',
      max_import_duration = '10m'
    ) AS
    SELECT 
    s.name, 
    count(*) as numwait
    FROM 
    "gbq"."tpchsf100"."supplier" s,
    "gbq"."tpchsf100"."lineitem" l1,
    "gbq"."tpchsf100"."orders" o,
    "gbq"."tpchsf100"."nation" n
    WHERE 
    s.suppkey = l1.suppkey 
    AND o.orderkey = l1.orderkey
    AND o.orderstatus = 'F'
    AND l1.receiptdate> l1.commitdate
    AND EXISTS (
    SELECT 
    * 
    FROM 
    "gbq"."tpchsf100"."lineitem" l2
    WHERE 
    l2.orderkey = l1.orderkey
    AND l2.suppkey <> l1.suppkey
    ) 
    AND NOT EXISTS (
    SELECT 
    * 
    FROM 
    "gbq"."tpchsf100"."lineitem" l3
    WHERE 
    l3.orderkey = l1.orderkey 
    AND l3.suppkey <> l1.suppkey 
    AND l3.receiptdate > l3.commitdate
    ) 
    AND s.nationkey = n.nationkey 
    AND n.name = 'SAUDI ARABIA'
    GROUP BY 
    s.name
    ORDER BY 
    numwait DESC, 
    s.name
    LIMIT 
    100

Step 8:

Note: Check you have the below set, so older versions of Materialized Views can be spooled out.
hive.security=all


