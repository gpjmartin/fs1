# Sample k8s yaml for Starburst Enterprise

v1_ingress_tls.yaml - Basic Cluster. Needs a secret with the license key call starburstdata. Expecting an Ingress Controller, DNS, Certificate. </br>

sep_catalogs_basic_v1.yaml - Internal catalogs only. No dependencies on external data sources. </br> 

1. Run the 'sample.sh' calling both files above. </br>

v2_backend_db.yaml - Adding a Backend Postgres Database. Validate by running a query in the UI, and checking it appears in the Query Overview Screen. </br>

2. Run the 'sample.sh' calling the v2 cluster yaml above, and the catalog v1 file. </br>

sep_catalogs_basic_v2_postgres.yaml - Adding the Postgres Database to the Catalog list. Validate the Catalog by running SQL against Tables in the Catalog.  </br> 

3. Run the 'sample.sh' calling the v2 cluster yaml above, and the catalog v2 file. </br>

v3_biac.yaml - switches Access Control to Starburst BIAC (Built-In Access Control). Roles and Privileges based. Access Control Screen appears via Left Hand Side of Insights UI. </br>

4. Run the 'sample.sh' calling the v3 cluster yaml above, and the catalog v2 file. </br>

