
The queries below use either the "tiny" or the "sf100" schema. </br>

You can change the schema to change the rows processed, and the query response time.

For row counts of the schemas, please see below. Divide of Mulitple by 10 up moving up or down the Scale Factors: </br>

https://github.com/gpjmartin/fs1/tree/main/tpch_sizes

    select
      c.name,
      c.nationkey,
      sum(l.extendedprice) as spend,
      avg(l.discount) as avgdiscount
    from
      tpch.sf100.customer as c
      inner join tpch.sf100.orders as o using (custkey)
      inner join tpch.sf100.lineitem as l using (orderkey)
    where
      c.mktsegment = 'AUTOMOBILE'
      and c.nationkey in (6, 7, 19, 21, 22)
      and o.orderstatus = 'F'
      and o.orderdate >= date('1993-06-01')
    group by
      c.name,
      c.mktsegment,
      c.nationkey,
      o.orderstatus,
      o.orderdate
    order by
      spend desc;

    SELECT
      COUNT(*) AS LINEITEMS,
      Q.PARTKEY,
      R.NAME,
      P.ORDERKEY,
      T.SUPPKEY,
      U.PARTKEY,
      V.NAME,
      W.NAME as NATION,
      X.NAME as REGION
    FROM
      tpch.tiny.customer AS R
      INNER JOIN tpch.tiny.orders AS P ON R.CUSTKEY = P.CUSTKEY
      INNER JOIN tpch.tiny.lineitem AS Q ON P.ORDERKEY = Q.ORDERKEY
      INNER JOIN tpch.tiny.supplier AS T ON Q.SUPPKEY = T.SUPPKEY
      INNER JOIN tpch.tiny.partsupp AS U ON T.SUPPKEY = U.SUPPKEY
      INNER JOIN tpch.tiny.part AS V ON U.PARTKEY=V.PARTKEY
      INNER JOIN tpch.tiny.nation AS W ON T.NATIONKEY=W.NATIONKEY
      INNER JOIN tpch.tiny.region AS X ON W.REGIONKEY=X.REGIONKEY
      WHERE X.NAME = 'EUROPE'
    GROUP BY
      Q.PARTKEY,
      R.NAME,
      P.ORDERKEY,
      T.SUPPKEY,
      U.PARTKEY,
      V.NAME,
      W.NAME,
      X.NAME
    HAVING
      COUNT(*) > 1
    ORDER BY
      1 DESC;
      
 Note: Query can be slow (designed to be resource intensive):</br>
 
    SELECT 
      s.name, 
      count(*) as numwait
    FROM 
      "tpch"."tiny"."supplier" s,
      "tpch"."tiny"."lineitem" l1,
      "tpch"."tiny"."orders" o,
      "tpch"."tiny"."nation" n
    WHERE 
      s.suppkey = l1.suppkey 
      AND o.orderkey = l1.orderkey
      AND o.orderstatus = 'F'
      AND l1.receiptdate> l1.commitdate
      AND EXISTS (
    SELECT 
      * 
      FROM 
      "tpch"."tiny"."lineitem" l2
    WHERE 
      l2.orderkey = l1.orderkey
      AND l2.suppkey <> l1.suppkey
      ) 
      AND NOT EXISTS (
    SELECT 
      * 
      FROM 
      "tpch"."tiny"."lineitem" l3
    WHERE 
      l3.orderkey = l1.orderkey 
      AND l3.suppkey <> l1.suppkey 
      AND l3.receiptdate > l3.commitdate
      ) 
      AND s.nationkey = n.nationkey 
      AND n.name = 'SAUDI ARABIA'
    GROUP BY 
      s.name
    ORDER BY 
      numwait DESC, 
      s.name
      LIMIT 
      100      


    
