# Stargate

Please check the Docs:
https://docs.starburst.io/latest/connector/starburst-stargate.html </br>

Assuming the Cloud deployed Starburst Cluster will connect to the on-premises Starburst Cluster:

In Ansible, add a file in the ../files/catalog directory, e.g. hive_remote.properties</br>
Push the configs after the file has been added. </br>
Sample details for the config files provided below:</br>
You will need to change the URL, user, and password. </br>
The connector name will remain the same.

    connector.name=stargate
    connection-url=jdbc:trino://${ENV:GoogleStargateConnection}/hdp
    connection-user=${ENV:StargateUsername}
    connection-password=${ENV:StargatePassword}
    ssl.enabled=false
    stargate.impersonation.enabled=true
    metadata.cache-ttl=30m
