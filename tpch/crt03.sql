-- create views
create view as #CAT01#.#SCH02##SIZE#.customer as  select * from #CAT01#.#SCH01##SIZE#.customer ;
create view as #CAT01#.#SCH02##SIZE#.lineitem as  select * from #CAT01#.#SCH01##SIZE#.lineitem ;
create view as #CAT01#.#SCH02##SIZE#.nation as  select * from #CAT01#.#SCH01##SIZE#.nation ;
create view as #CAT01#.#SCH02##SIZE#.orders as  select * from #CAT01#.#SCH01##SIZE#.orders ;
create view as #CAT01#.#SCH02##SIZE#.part as  select * from #CAT01#.#SCH01##SIZE#.part ;
create view as #CAT01#.#SCH02##SIZE#.partsup as  select * from #CAT01#.#SCH01##SIZE#.partsup ;
create view as #CAT01#.#SCH02##SIZE#.region as  select * from #CAT01#.#SCH01##SIZE#.region ;
create view as #CAT01#.#SCH02##SIZE#.supplier as  select * from #CAT01#.#SCH01##SIZE#.supplier ;
