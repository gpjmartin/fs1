# Stargate

Please check the Docs:
https://docs.starburst.io/latest/connector/starburst-stargate.html </br>

Assuming the Cloud deployed Starburst Cluster will connect to the on-premises Starburst Cluster:

In Ansible, add a file in the ../files/catalog directory, e.g. hive_remote.properties</br>
Push the configs after the file has been added. </br>
Sample details for the config files provided below:</br>
You will need to change the URL, user, and password. </br>
The connector name will remain the same.</br>
SSL and Impersonation added for awareness.

Access to On-Premise Hive/HDFS, defined in GCP Cluster, e.g. ../files/catalog/hive_remote.properties:

    connector.name=stargate
    connection-url=jdbc:trino://remote-cluster.example.net:8080/hive
    connection-user=some_sep_user
    connection-password=some_password
    ssl.enabled=false
    stargate.impersonation.enabled=false
    metadata.cache-ttl=30m

Access to GCP Big Query, defined on premises, e.g. ../files/catalog/gbq_remote.properties

    connector.name=stargate
    connection-url=jdbc:trino://${ENV:GoogleStargateConnection}/bigquery
    connection-user=${ENV:StargateUsername}
    connection-password=${ENV:StargatePassword}
    ssl.enabled=true
    stargate.impersonation.enabled=true
    metadata.cache-ttl=30m
    
Access to GCS, defined on premises, e.g. ../files/catalog/gcs_remote.properties

    connector.name=stargate
    connection-url=jdbc:trino://${ENV:GoogleStargateConnection}/hive
    connection-user=${ENV:StargateUsername}
    connection-password=${ENV:StargatePassword}
    ssl.enabled=true
    stargate.impersonation.enabled=true
    metadata.cache-ttl=30m
