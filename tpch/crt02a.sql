set session preferred_write_partitioning_min_number_of_partitions=1;
set session use_preferred_write_partitioning=true;

drop table  if exists #CAT01#.#SCH01##SIZE#.lineitem_#YEAR#;
drop table  if exists #CAT01#.#SCH01##SIZE#.orders_#YEAR#;

-- create tables

create table  #CAT01#.#SCH01##SIZE#.lineitem_#YEAR#
with ( format='PARQUET' , bucketed_by=ARRAY['receiptdate'] , bucket_count=50 )
as  
select  orderkey,partkey, suppkey , linenumber , quantity,extendedprice,discount,tax,returnflag
,linestatus,shipdate,commitdate,shipinstruct,shipmode,comment,receiptdate
from tpch.#SIZE#.lineitem 
where extract( year from receiptdate) = #YEAR#
;


create table  #CAT01#.#SCH01##SIZE#.orders_#YEAR#
with ( format='PARQUET', bucketed_by=ARRAY['orderdate'] , bucket_count=1)
as
select  orderkey, custkey , orderstatus , totalprice  , orderpriority , clerk , shippriority , comment , orderdate
from tpch.#SIZE#.orders 
where extract( year from orderdate) = #YEAR#
;
