
set session preferred_write_partitioning_min_number_of_partitions=1;
set session use_preferred_write_partitioning=true;

-- create tables

insert into #CAT01#.#SCH01##SIZE#.lineitem
select  orderkey,partkey, suppkey , linenumber , quantity,extendedprice,discount,tax,returnflag
,linestatus,shipdate,commitdate,shipinstruct,shipmode,comment,receiptdate
from tpch.#SIZE#.lineitem 
where extract( year from receiptdate) = #YEAR#
and extract( month from receiptdate) in (1,2)
;

insert into #CAT01#.#SCH01##SIZE#.lineitem
select  orderkey,partkey, suppkey , linenumber , quantity,extendedprice,discount,tax,returnflag
,linestatus,shipdate,commitdate,shipinstruct,shipmode,comment,receiptdate
from tpch.#SIZE#.lineitem 
where extract( year from receiptdate) = #YEAR#
and extract( month from receiptdate) in (3,4)
;

insert into #CAT01#.#SCH01##SIZE#.lineitem
select  orderkey,partkey, suppkey , linenumber , quantity,extendedprice,discount,tax,returnflag
,linestatus,shipdate,commitdate,shipinstruct,shipmode,comment,receiptdate
from tpch.#SIZE#.lineitem 
where extract( year from receiptdate) = #YEAR#
and extract( month from receiptdate) in (5,6)
;

insert into #CAT01#.#SCH01##SIZE#.lineitem
select  orderkey,partkey, suppkey , linenumber , quantity,extendedprice,discount,tax,returnflag
,linestatus,shipdate,commitdate,shipinstruct,shipmode,comment,receiptdate
from tpch.#SIZE#.lineitem 
where extract( year from receiptdate) = #YEAR#
and extract( month from receiptdate) in (7,8)
;

insert into #CAT01#.#SCH01##SIZE#.lineitem
select  orderkey,partkey, suppkey , linenumber , quantity,extendedprice,discount,tax,returnflag
,linestatus,shipdate,commitdate,shipinstruct,shipmode,comment,receiptdate
from tpch.#SIZE#.lineitem 
where extract( year from receiptdate) = #YEAR#
and extract( month from receiptdate) in (9,10)
;


insert into #CAT01#.#SCH01##SIZE#.lineitem
select  orderkey,partkey, suppkey , linenumber , quantity,extendedprice,discount,tax,returnflag
,linestatus,shipdate,commitdate,shipinstruct,shipmode,comment,receiptdate
from tpch.#SIZE#.lineitem 
where extract( year from receiptdate) = #YEAR#
and extract( month from receiptdate) in (11,12)
;


