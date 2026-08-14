-- Perform a case-insensitive search to find all facilities whose name begins with 'tennis'. Retrieve all columns.

select * from cd.facilities where lower(name) like 'tennis%'

-- ilike is case-insensitive
select * from cd.facilities where (name) ilike 'Tennis%'


-- answer

select * from cd.facilities where upper(name) like 'TENNIS%';

-- upper, lower or ilike will prevent indexes searching if we create indexes base on the raw value of column before
-- instead we can create an index with function
-- CREATE INDEX idx_facilities_name ON cd.facilities(upper(name));
