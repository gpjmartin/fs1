#Update the Cluster Config with the cache service details:

   service-database.user=postgres </br>
   service-database.password=PASSWORD_HERE </br>
   service-database.jdbc-url=jdbc:postgresql://<postgre-db-hostname>:5432/cache_service </br>
        
   starburst.user=cache-service </br>
   starburst.jdbc-url=jdbc:trino://coordinator:8080 </br>
  
  
  
