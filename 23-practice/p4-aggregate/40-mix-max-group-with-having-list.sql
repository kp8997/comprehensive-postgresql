-- Output the facility id that has the highest number of slots booked.
-- For bonus points, try a version without a LIMIT clause.
-- This version will probably look messy!
select b.facid,
	sum(b.slots) as sum_by_slots
from cd.bookings b
group by b.facid
having sum(b.slots) = (
		select max(sum_slots)
		from (
				select sum(slots) as sum_slots
				from cd.bookings
				group by facid
			)
	)
order by facid;
-- answer
select facid,
	sum(slots) as totalslots
from cd.bookings
group by facid
having sum(slots) = (
		select max(sum2.totalslots)
		from (
				select sum(slots) as totalslots
				from cd.bookings
				group by facid
			) as sum2
	);
-- advance answer with CTE
with sum as (
	select facid,
		sum(slots) as totalslots
	from cd.bookings
	group by facid
)
select facid,
	totalslots
from sum
where totalslots = (
		select max(totalslots)
		from sum
	);
