version=427.0.0
#helm search repo -l starburstdata/starburst-enterprise 
#helm show values --version 423.3.0 starburstdata/starburst-enterprise
##
creds=/starburst/registry-access.yaml
sep=/starburst/v1_ingress_tls.yaml
cat=/starburst/sep_catalogs_basic_v1.yaml
#kubectl apply -f /starburst/vars-deployment-gm.yaml
helm upgrade starburst starburstdata/starburst-enterprise --install --version $version --values $creds --values $sep --values $cat 
###########
#HIVE
#helm upgrade hive starburstdata/starburst-hive --install --version $version  --values $creds --values /starburst/hive.yaml
kubectl get pods -A
