Step 1: Download and unxip the Cache tarball file: </br>

https://s3.us-east-2.amazonaws.com/software.starburstdata.net/380e/380-e.3/starburst-cache-service-380-e.3.tar.gz


Step 2: Cache Service

Update the Cluster Config with the cache service details. 
Create a file in ../extra/etc called cache.properties and add the below:

    service-database.user=postgres 
    service-database.password=PASSWORD_HERE 
    service-database.jdbc-url=jdbc:postgresql://<postgre-db-hostname>:5432/cache_service 
        
    starburst.user=cache-service 
    starburst.jdbc-url=jdbc:trino://192.168.0.2:8080 
  
    http-server.http.port=8180

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




