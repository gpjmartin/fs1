Catalog Files: …./admin/files/catalog

hive.properties:

connector.name=hive </br>
hive.metastore.uri=thrift://10.23.192.15:9083 </br>
hive.metastore-cache-ttl=60m </br>
hive.gcs.json-key-file-path=/etc/starburst/gcs_keyfile.json </br>
hive.gcs.use-access-token=false </br>
#hive.metastore-cache-maximum-size=100000 </br>
#hive.metastore-refresh-interval=5m </br>
#hive.file-status-cache-expire-time=30m </br>
#hive.file-status-cache-size=1000000 </br>
#hive.delta-lake-catalog-name=deltalake </br>
#hive.security=starburst </br>
hive.security=allow-all </br>
#hive.non-managed-table-writes-enabled=true </br>
#redirection.config-source=SERVICE </br>
#cache-service.uri=http://192.168.0.2:8180 </br>
materialized-views.enabled=true </br>
materialized-views.namespace=materialized_views </br>
materialized-views.storage-schema=views_cache_storage	</br>
#materialized-views.allow-run-as-invoker=true </br>

delta.properties: </br>

connector.name=delta-lake </br>
hive.metastore.uri=thrift://10.23.192.15:9083 </br>
delta.metadata.cache-ttl=30m </br>
hive.security=allow-all </br>
delta.hive-catalog-name=hive </br>
delta.enable-non-concurrent-writes=true </br>
#hive.non-managed-table-writes-enabled=true </br>
hive.metastore-refresh-interval=5m </br>
#redirection.config-source=SERVICE </br>
#cache-service.uri=http://192.168.0.2:8180 </br>


iceberg.properties </br>

connector.name=iceberg </br>
hive.metastore.uri=thrift://10.23.192.15:9083 </br>


bigquery.properties: </br>

connector.name=bigquery </br>
bigquery.project-id=$YOUR_PROJECT_HERE </br>
bigquery.views-enabled=true </br>
bigquery.project-prefix-for-schema.enabled=false </br>
bigquery.project-cache-ttl=30m </br>
bigquery.parallelism=12 </br>
#bigquery.query-results-cache.enabled=true </br>
bigquery.credentials-file=/etc/starburst/gcs_keyfile.json </br>

jmx.properties: </br>
connector.name=jmx </br>

tpcds.properties: </br>
connector.name=tpcds </br>

tpch.properties </br>
connector.name=tpch </br>

postgres.properties: </br>
connector.name=postgresql </br>
connection-url=jdbc:postgresql://34.34.34.34:5432/$INPUT_DB_NAME </br>
connection-user=postgres </br>
connection-password=$INPUT_PW_HERE </br>



Note: postgres just for example. </br>


Cluster Config files…../admin/files/coordinator/......and ../admin/files/worker: </br>

jvm.config.j2 </br>

-server </br>
-Xmx16G </br>
-XX:InitialRAMPercentage=80 </br>
-XX:MaxRAMPercentage=80 </br>
-XX:G1HeapRegionSize=32M </br>
-XX:+ExplicitGCInvokesConcurrent </br>
-XX:+ExitOnOutOfMemoryError </br>
-XX:+HeapDumpOnOutOfMemoryError </br>
-XX:-OmitStackTraceInFastThrow </br>
-XX:ReservedCodeCacheSize=512M </br>
-XX:PerMethodRecompilationCutoff=10000 </br>
-XX:PerBytecodeRecompilationCutoff=10000 </br>
-Djdk.attach.allowAttachSelf=true </br>
-Djdk.nio.maxCachedBufferSize=2000000 </br>
-XX:+UnlockDiagnosticVMOptions </br>
-XX:+UseAESCTRIntrinsics </br>

log.properties: </br>
Io.trino=DEBUG </br>

../admin/files/coordinator</br>

Add user-specific properties below </br>

internal-communication.shared-secret=$SHARED_SECRET </br>
query.max-memory=1PB </br>
query.max-memory-per-node=2867MB </br>
insights.persistence-enabled=true </br>
insights.metrics-persistence-enabled=true </br>
insights.jdbc.url=jdbc:postgresql://34.34.34.34:5432/$DB_NAME_HERE </br>
insights.jdbc.user=postgres </br>
insights.jdbc.password=$DB_NAME_HERE </br>
#insights.authorized-users=starburst_service </br>
query.client.timeout=120m </br>
http-server.https.enabled=true </br>
http-server.https.port=8443 </br>
http-server.https.keystore.path=/etc/starburst/coordinator.pem </br>
http-server.authentication.type=PASSWORD </br>
http-server.authentication.allow-insecure-over-http=true </br>
http-server.process-forwarded=true </br>
starburst.access-control.enabled=true </br>
starburst.access-control.authorized-users=starburst_service </br>
starburst.user=caching_service </br>
starburst.password=$PASSWORD </br>
starburst.jdbc-url=jdbc:trino://192.168.0.2:8080 </br>
#rules.file=/etc/starburst/cache-rules.json </br>
#rules.refresh-period=1m </br>
#refresh-initial-delay=1m </br>
#refresh-interval=2m </br>
service-database.user=postgres </br>
service-database.password=$PASSWORD </br>
service-database.jdbc-url=jdbc:postgresql://34.34.34.34:5432/binary_redirections </br>
starburst.jdbc-url=jdbc:trino://localhost:8443?SSL=true&SSLVerification=NONE </br>
starburst.user=cache-service


../admin/files/worker </br>

config.properties.j2 </br>

internal-communication.shared-secret=$SHARED_SECRET </br>
query.max-memory=1PB </br>
query.max-memory-per-node=2867MB </br>
