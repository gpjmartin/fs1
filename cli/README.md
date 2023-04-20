# Using the trino CLI to run testing alongside 


When testing with JMeter - there is a scenario when large datasets are being returned in the JMeter (i.e. via the JDBC Connector).</br>

Over a certain volume - the JMeter client gets over-loaded by the result-sets being returned. </br>

When this occurs - the following can be observed (OutOfMemoryError: Java heap space) in the JMeter Log View panel:</br>


![Screenshot 2023-04-20 at 15 24 45](https://user-images.githubusercontent.com/21335020/233396527-040c4567-8f3e-4162-8fb9-4671370a8860.png)

I the Starburst UI - Query Overview screen, the SQL will show as having been successfully executed - but with a display 'Query results were truncated' message. </br>

![Screenshot 2023-04-20 at 12 42 40](https://user-images.githubusercontent.com/21335020/233405203-eab83247-c57f-4800-a554-500c65ddf2af.png)


![Screenshot 2023-04-20 at 12 46 29](https://user-images.githubusercontent.com/21335020/233397151-9605480b-45ad-4dea-8b27-fd922ec26502.png)

The SQL has been successful - the transmission of the results set to JMeter has had an error - due to the JMeter client having the above Java heap space error. The error is the result of the volume of records being returned. In this test the SQL being run is: </br>

  select * from tpch.sf1.lineitem 

This table has over 6m rows, and approx 874MB in size. </br>

Running this in the Starburst UI (Run and Download mode) is problematic at these volumes - as something other than Starburst can block that download (Security Data Exfiltration policies, Browser limitations, etc).</br>

If you need to run a test with the result sets being returned in full, you can use the trino CLI to avoid hitting limitations in other clients and services. </br>

Download and install the latest trino cli. Follow the steps as per the docs to connect to a Starburst Enterprise:</br>

https://docs.starburst.io/latest/client/cli.html

To test SQL, create a file - e.g. sql.txt and add in the required SQL you want to test.

Comment: would advise to change the 'sf1' schema for the 'tiny' schema as the volumes are large (~ 1GB will get written for the below SQL): </br>

  SELECT * FROM tpch.sf1.lineitem;

Create a simple batch file to run the SQL. Iterations can be performed as required. Change the directory to match where the trino CLI is installed.</br> 

    #!/bin/bash
    ITERATIONS=1
    for ((x = 1 ; x < $ITERATIONS +1 ; x++)); 
    do
    #nohup /install_directory/trino --server http://10.1.1.10:8080 --user=starburst_service -f sql.txt --output-format=null  --progress &
    nohup /install_directory/trino --server http://10.1.1.10:8080 --user=starburst_service -f sql.txt --output-format=csv  --progress &
    sleep 10
    done

Comment - if you want to test just the functionality - you can set the output to 'null'. </br>
If you require to test the entire result-set passed to the client, set the output to a format, such as 'csv'. </br>

In this test, the entire result set of the SQL was transmitted (~1GB) from Starburst to the trino CLI. </br>

There were no errors in the Starburst UI. </br>

In summary - certain client tools such as JMeter, are not designed to handle large data volumes in results sets. This can cause an error in the Starburst UI - though that is mis-leading as the SQL was run successfully in Starburst. The issue is that the client was unable to handle the data volumes. Testin in JMeter is better served using SQL that returns low to medium data volumes. The TPC-H Queries can be used as examples. </br>
Other client tools - BI Tools in particular, are better designed to handle large result sets from SQL Queries.





