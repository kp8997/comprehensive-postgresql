-- Produce a list of member names, with each row containing the total member count.
-- Order by join date, and include guest members.
select count(*) over () as count,
  firstname,
  surname
from cd.members
order by joindate;

-- we also have over (partition by column) to aggregate over a sub-group and add the column alongside with row
-- e.g
-- select count(*) over(partition by date_trunc('month',joindate) order by joindate asc), 
-- 	count(*) over(partition by date_trunc('month',joindate) order by joindate desc), 
-- 	firstname, surname
-- 	from cd.members
-- order by joindate

-- answer in verbose way

select (
    select count(*)
    from cd.members
  ) as count,
  firstname,
  surname
from cd.members
order by joindate
