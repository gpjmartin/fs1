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
Check Active Environment:</br>

    SELECT * FROM "postgres"."public"."usage_metrics" order by sample_time desc LIMIT 10;


CPU Load on the Cluster:</br>

    SELECT
        date_trunc('hour', create_time) create_time,
        sum(cpu_time_ms) sum_cpu,
        round(avg(cpu_time_ms),0) avg_cpu
    FROM
        "postgres"."public"."completed_queries"
    WHERE
        create_time >= date '2025-01-01'
    GROUP BY
        date_trunc('hour', create_time)
    ORDER BY
        date_trunc('hour', create_time) desc
    LIMIT 100;

Completed Queries - Grouped by Date and Hour:</br>

    SELECT
        date_trunc('hour', create_time),
        count(*) as count
    FROM
        postgres.public.completed_queries
    GROUP BY
       date_trunc('hour', create_time)
    ORDER BY
       date_trunc('hour', create_time) desc;
    
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


 Completed Queries - Grouped by User and Table:</br>
 
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

Distinct Users by Day:</br>
    
    select
        date_trunc('day', create_time) Distinct_Users,
        count(distinct usr) as count
    from
        postgres.public.completed_queries
    group by
        date_trunc('day', create_time)
    order by
        1 desc;

Show aggregate total of cpu time for all queries grouped by users:</br>

    SELECT  usr,
        sum(cpu_time_ms) as total_cpu_time_ms,
        sum(cpu_time_ms / (1000 * 60) % 60) as total_cpu_time_minutes,
        sum(cpu_time_ms / (1000 * 60 * 60) % 24) as total_cpu_time_hours
    FROM "postgres"."public"."completed_queries"
    GROUP BY usr;

Get Cluster Metrics during highest concurrency of running queries:</br>

    SELECT running_queries,
        queued_queries,
        sample_interval_start,
        sample_interval_end,
        nodes,
        cpus,
        system_cpu_load,
        process_cpu_load,
        presto_memory,
        used_query_memory,
        total_query_memory,
        used_heap_size,
        total_heap_size
    FROM "postgres"."public"."cluster_metrics"
    WHERE running_queries > 0
    ORDER BY running_queries DESC
    LIMIT 10;    

    
Get Cluster Metrics during highest concurrency of queued queries:</br>

    SELECT queued_queries,
        sample_interval_start,
        sample_interval_end,
        nodes,
        cpus,
        system_cpu_load,
        process_cpu_load,
        presto_memory,
        used_query_memory,
        total_query_memory,
        used_heap_size,
        total_heap_size
    FROM "postgres"."public"."cluster_metrics"
    WHERE queued_queries > 0
    ORDER BY queued_queries DESC
    LIMIT 10;
    
Date, MAX_CPU_LOAD, Running, and Queued Queries:</br>

    SELECT 
        DATE(sample_interval_start) AS DATE,
        MAX(system_cpu_load) AS MAX_CPU_LOAD, 
        RUNNING_QUERIES, 
        QUEUED_QUERIES
    FROM "postgres"."public"."cluster_metrics" 
    GROUP BY DATE(sample_interval_start), RUNNING_QUERIES, QUEUED_QUERIES
    ORDER BY 1 DESC;



