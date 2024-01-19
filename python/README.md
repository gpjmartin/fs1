# Sample Notebooks

1. SEP_Python_pub_v2.ipynb:

Sample Notebook using the trino-python-client, connecting to Starburst Enterprise (>= LTS 429), and running SQL.
Also has a snippet to connect using SQLAlchemy syntax.

2. PyStarburst_pub_v2.ipynb:

Contains PyStarburst syntax (aka Dataframe syntax). Snippets contain examples of using the Dataframe type syntax - which executes as SQL on Starburst. Some sample visuals and Data transforms are included.

**Note: To enable PyStarburst on Starburst Enterprise, please make the following change to config.properties:

starburst.dataframe-api-enabled=true

The above is enabled by default on Galaxy.

**Note: If you are using BIAC or Ranger - you will also need to add a Privilege to the User's Role:

https://docs.starburst.io/latest/client/python.html#enable-pystarburst-in-sep

**Note: The Notebook uses a Table - sample.demo.missions </BR>
This Tables exists by default in Galaxy - but you need to add the sample Catalog to a Cluster.</BR>
If you are using Starburst Enterprise - the catalog/schema/table won't exist by default.</BR>
One option is to sign up to Galaxy, download the file, and upload to an Object Store for Starburst to access.</BR>
Another option is to create the Table manually. See DDL at the bottom of this page to give you a head start.</BR>

For more info on Notebooks and Python: </BR>

https://gpjmartin.wordpress.com/2022/12/06/working-with-starburst-enterprise-and-jupyter-notebooks/</BR>

CREATE TABLE sample.demo.missions (</BR>
   id varchar,</BR>
   company_name varchar,</BR>
   location varchar,</BR>
   date varchar,</BR>
   detail varchar,</BR>
   status_rocket varchar,</BR>
   cost varchar,</BR>
   status_mission varchar</BR>
)</BR>
WITH</BR>
  (</BR>
    FORMAT = 'CSV',</BR>
    EXTERNAL_LOCATION = 's3://PUT_YOUR_ACCOUNT_HERE/mission/',</BR>
    skip_header_line_count = 1,</BR>
  );</BR>
