#Update the Cluster Config with the cache service details:

  
   service-database.user=<db-login>
   service-database.password=<db-password>
   service-database.jdbc-url=jdbc:postgresql://<postgre-db-hostname>:5432/cache_service
        
   starburst.user=cache-service
   starburst.jdbc-url=jdbc:trino://coordinator:8080
  
  
  
