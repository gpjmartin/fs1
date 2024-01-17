# Sample Notebooks

1. SEP_Python_pub_v2.ipynb:

Sample Notebook using the trino-python-client, connecting to Starburst Enterprise (>= LTS 429), and running SQL.
Also has a snippet to connect using SQLAlchemy syntax.

2. PyStarburst_pub_v2.ipynb:

Contains PyStarburst syntax (aka Dataframe syntax). Snippets contain examples of using the Dataframe type syntax - which executes as SQL on Starburst. Some sample visuals and Data transforms are included.

**Note: To enable PyStarburst on Starburst Enterprise, please make the following change to config.properties:

starburst.dataframe-api-enabled=true

The above is enabled by default on Galaxy.


For more info on Notebooks and Python:

https://gpjmartin.wordpress.com/2022/12/06/working-with-starburst-enterprise-and-jupyter-notebooks/
