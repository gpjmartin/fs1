#Ignore this for now
#Setting up Users and Passwords

Create password file:

cd $SB_ANSIBLE_ADMIN_DIR/files/extra/etc

sudo touch password.db

sudo dnf install httpd-tools -y

sudo htpasswd -B -C 10 password.db starburst_service

Set the password at the prompt.

Repeat for caching_service

Create password 

cd $SB_ANSIBLE_ADMIN_DIR/files/extra/etc

vi password-authenticator.properties

password-authenticator.name=file
file.password-file=etc/password.db

Push the files out using the ansible commands.

The following needs to be changed in the config.properties file also:
http-server.authentication.type=PASSWORD
