
set session preferred_write_partitioning_min_number_of_partitions=1;
set session use_preferred_write_partitioning=true;

drop table  if exists #CAT01#.#SCH01##SIZE#.customer;
drop table  if exists #CAT01#.#SCH01##SIZE#.nation;
drop table  if exists #CAT01#.#SCH01##SIZE#.orders; 
drop table  if exists #CAT01#.#SCH01##SIZE#.part;
drop table  if exists #CAT01#.#SCH01##SIZE#.region;
drop table  if exists #CAT01#.#SCH01##SIZE#.supplier;


-- create tables
create table  #CAT01#.#SCH01##SIZE#.customer  
with ( partitioned_by = ARRAY['nationkey'] , format='PARQUET' , bucketed_by=ARRAY['custkey'] , bucket_count=1) 
as
select custkey , name , address , phone , acctbal , comment , mktsegment , nationkey  
from tpch.#SIZE#.customer 
;


create table  #CAT01#.#SCH01##SIZE#.nation 
with ( format='PARQUET' , bucketed_by=ARRAY['regionkey'] , bucket_count=1)
as  
select name , regionkey , comment , nationkey
from tpch.#SIZE#.nation ;


create table  #CAT01#.#SCH01##SIZE#.part 
with (  format='PARQUET' ,bucketed_by=ARRAY['partkey'] , bucket_count=50)
as
select partkey, name, mfgr , brand ,  size , container , retailprice , comment , type
from tpch.#SIZE#.part 
;

create table  #CAT01#.#SCH01##SIZE#.partsupp 
with ( format='PARQUET' ,bucketed_by=ARRAY['partkey'] , bucket_count=10)
as  
select partkey , availqty , supplycost , comment , suppkey
from tpch.#SIZE#.partsupp ;

create table  #CAT01#.#SCH01##SIZE#.region 
as  
select regionkey , name , comment
from tpch.#SIZE#.region ;

create table #CAT01#.#SCH01##SIZE#.supplier 
with ( partitioned_by = ARRAY['nationkey'] , format='PARQUET'  ,bucketed_by=ARRAY['suppkey'] , bucket_count=1)
as  
select  suppkey , name , address  , phone , acctbal , comment, nationkey
from tpch.#SIZE#.supplier 
;

