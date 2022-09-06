Step 1: Cache Service

Update the Cluster Config with the cache service details

    service-database.user=postgres 
    service-database.password=PASSWORD_HERE 
    service-database.jdbc-url=jdbc:postgresql://<postgre-db-hostname>:5432/cache_service 
        
    starburst.user=cache-service 
    starburst.jdbc-url=jdbc:trino://coordinator:8080 
  
    http-server.http.port=8180

After re-cycling the cluster, the new schemas under the cache_service database should appear.
   
Step 2: Hive Config

    connector.name=hive
    ...
    cache-service.uri=http://192.168.0.2:8180
    materialized-views.enabled=true
    materialized-views.namespace=mv_namespace
    materialized-views.storage-schema=mv_storage
    
In the above example, you need to create the schemas - mv_namespace and mv_storage. </br>
The mv_storage is where the physical Materialized Views will be persisted in Hive.

Step 3: Create Materialized View's Schemas

CREATE SCHEMA hive.mf_mv_storage
WITH (location = 'gs://gcs-bucket/mv_storage/')

Step 4: Create a Materialized View

CREATE OR REPLACE MATERIALIZED VIEW hive.test.test_mat_view
WITH (
     max_import_duration = '1m'
     refresh_interval = '5m'
     grace_period = '10m'
     )
AS
SELECT * FROM tpch.tiny.lineitem




