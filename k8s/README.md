# Sample k8s yaml for Starburst Enterprise

v1_ingress_tls.yaml - Basic Cluster. Needs a secret with the license key call starburstdata. Expecting an Ingress Controller, DNS, Certificate. </br>

sep_catalogs_basic_v1.yaml - Internal catalogs only. No dependencies on external data sources. </br> 

Run the 'sample.sh' calling both files above. </br>

v2_backend_db.yaml - Adding a Backend Postgres Database. Validate by running a query in the UI, and checking it appears in the Query Overview Screen. </br>

