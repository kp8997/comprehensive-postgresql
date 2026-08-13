-- Produce a list of the total number of slots booked per facility per month in the year of 2012. In this version,
-- include output rows containing totals for all months per facility, and a total for all months for all facilities.
-- The output table should consist of facility id, month and slots, sorted by the id and month.
-- When calculating the aggregated values for all months and all facids, return null values in the month and facid columns.
(
  select facid,
    extract(
      month
      from b.starttime
    ) as month,
    sum(slots)
  from cd.bookings b
  where starttime > '2012-01-01'
    and starttime < '2013-01-01'
  group by facid,
    month
)
UNION ALL
(
  select facid,
    NULL as month,
    sum(slots) as slots
  from cd.bookings
  where starttime > '2012-01-01'
    and starttime < '2013-01-01'
  group by facid
)
UNION ALL
(
  select NULL as facid,
    NULL as month,
    sum(slots) as slots
  from cd.bookings
  where starttime > '2012-01-01'
    and starttime < '2013-01-01'
)
ORDER BY facid,
  month;
-- the purpose here is about combination of 3 query
-- count sum in each facid and each month
-- count sum in each facid (for all month)
-- count sum in all (all month and facid - use sum a column like normal one)
-- one more thing is we can order by just 1 time after all union (queries)
-- answer in advance
select facid,
  extract(
    month
    from starttime
  ) as month,
  sum(slots) as slots
from cd.bookings
where starttime >= '2012-01-01'
  and starttime < '2013-01-01'
group by rollup(facid, month)
order by facid,
  month;
-- rollup function take many columns and sequentially sum by group similar to 3 UNION ALL ABOVE
-- another advance answer with CTE

with bookings as (
	select facid, extract(month from starttime) as month, slots
	from cd.bookings
	where
		starttime >= '2012-01-01'
		and starttime < '2013-01-01'
)
select facid, month, sum(slots) from bookings group by facid, month
union all
select facid, null, sum(slots) from bookings group by facid
union all
select null, null, sum(slots) from bookings
order by facid, month
