
Creating Views over the Source Tables </br>

Run the script and output to an output file.
./views.sh > views.sql

Run the output either directly in the Query Editor, or from the trino CLI:

 ..../trino --user starburst_service  --server=https://10.10.10.10:8443 --file views.sql --password --insecure 
