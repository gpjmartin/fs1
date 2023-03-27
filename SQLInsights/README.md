# Running SQL Directly against the Starburst Insights Tables:

The Core Tables are: </br>
</br>
            query_tables </br>
            query_user_group</br>
            cluster_metrics</br>
            completed_queries</br>
            usage_metrics</br>
  
Some examples - You will likely need to change the catalog name to match the Insights Database:</br>
</br>
Check Active Node:</br>

SELECT * FROM "postgres"."public"."usage_metrics" LIMIT 10;</br>


CPU Load on the Cluster:</br>

    SELECT
        date_trunc('hour', create_time),
        sum(cpu_time_ms),
        avg(cpu_time_ms)
    FROM
        "postgres"."public"."completed_queries"
    WHERE
        create_time >= date '2022-11-01'
    GROUP BY
        date_trunc('hour', create_time)
    ORDER BY
        date_trunc('hour', create_time)
    LIMIT 100;
    
Users, Tables, Catalogs:</br>
    
    select
        count(*) as count,
        completed_queries.usr,
        query_tables.table_name
    from
        postgres.public.completed_queries,
        postgres.public.query_tables
    where
        completed_queries.query_id = query_tables.query_id
    group by
        usr,
        table_name
    order by
        1 desc;
    
High Level Queries by Catalog, Schema, Tables:</br>

    SELECT
        catalog_name,
        schema_name,
        table_name,
        count(query_id) as total_queries
    FROM
        "postgres"."public"."query_tables"
    WHERE
        catalog_name not like '$%'
    GROUP BY
        catalog_name,
        schema_name,
        table_name
    ORDER BY
        total_queries DESC;
    
    
    



