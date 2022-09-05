### You can use the syntax below to create Partitions on the Google Big Query Tables.

CREATE OR REPLACE TABLE `<project>.<schema>.lineitem2` </br>
 PARTITION BY date_trunc(shipdate,month) </br>
 AS </br>
 SELECT * FROM `<project>.<schema>.lineitem` </br>

If you want the original table name to remain intact, but now have partitioned data, </br>
you could follow:

DROP TABLE  `<project>.<schema>.lineitem`;</br>

Then</br>

CREATE OR REPLACE TABLE `<project>.<schema>.lineitem`</br>
 PARTITION BY date_trunc(shipdate,month)</br>
 AS</br>
 SELECT * FROM `<project>.<schema>.lineitem2` (edited) </br>
