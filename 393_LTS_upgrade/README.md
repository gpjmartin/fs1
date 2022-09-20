# Upgrade from 380 to 393 LTS

Uninstall Java 11 on ALL nodes, for example:
rpm -e zulu11.58.23-ca-jdk11.0.16.1-linux.x86_64.rpm  

Install Java 17 on ALL nodes, for example:

sudo curl -O https://cdn.azul.com/zulu/bin/zulu17.36.13-ca-jre17.0.4-linux.x86_64.rpm </br>

sudo rpm -i zulu17.36.13-ca-jre17.0.4-linux.x86_64.rpm

Confirm the correct version of java via 'java --version'

Update the ansible vars file - /.ansible/collections/ansible_collections/starburst/admin/playbooks/vars.yml

Change the first line to the target version - 393-e.1

version: 393-e.1

Change the rpm to the link below:

\# Use `installer_url` to avoid uploading the installer file to each host. </br>
installer_url: "https://s3.us-east-2.amazonaws.com/software.starburstdata.net/393e/393-e.1/starburst-enterprise-393-e.1.rpm"


Run the install playbook:

ansible-playbook playbooks/install.yml

The installer needs to complete with no errors.

After completion, push the configs out to the nodes, and restart.
