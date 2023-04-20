# Using the trino CLI to run testing alongside 


When testing with JMeter - there is a scenario when large datasets are being returned in the JMeter (i.e. via the JDBC Connector).</br>

Over a certain volume - the JMeter client gets over-loaded by the result-sets being returned. </br>

When this occurs - the following can be observed (OutOfMemoryError: Java heap space) in the JMeter Log View panel:</br>


![Screenshot 2023-04-20 at 15 24 45](https://user-images.githubusercontent.com/21335020/233396527-040c4567-8f3e-4162-8fb9-4671370a8860.png)

I the Starburst UI - Query Overview screen, the SQL will show as having been successfully executed - but with a display 'Query results were truncated' message. </br>


![Screenshot 2023-04-20 at 12 46 29](https://user-images.githubusercontent.com/21335020/233397151-9605480b-45ad-4dea-8b27-fd922ec26502.png)

The SQL has been successful - the transmission of the results set to JMeter has had an error - due to the JMeter client having the above Java heap space error. The error is the result of the volume of records being returned. In this test the SQL being run is: </br>

  select * from tpch.sf1.lineitem 

This table has over 6m rows, and approx 272MB in size. </br>

Running this in the Starburst UI (Run and Download mode) is problematic at these volumes - as something other than Starburst can block that download (Security Data Exfiltration policies, Browser limitations, etc).</br>

If you need to run a test with the result sets being returned in full, you can use the trino CLI to avoid hitting limitations in other clients and services. </br>
