-- Based on the 3 complete months of data so far, 
--  calculate the amount of time each facility will take to repay its cost of ownership.
-- Remember to take into account ongoing monthly maintenance.
-- Output facility name and payback time in months, order by facility name.
-- Don't worry about differences in month lengths, we're only looking for a rough value here!

select f.name,
f.initialoutlay / ((sum(case
	when b.memid = 0 then f.guestcost * b.slots
	else b.slots * f.membercost
end) / 3.0) - f.monthlymaintenance) as revenue
from cd.facilities f
join cd.bookings b on b.facid = f.facid
group by f.name, f.monthlymaintenance, f.initialoutlay
order by name

-- it is about the term and fomula, it should be the whole cost / profit per month -> how long we payback the initialoutlay
-- profit per month = (revenue / number of months) -  monthlymaintenance

-- answer
select 	name, 
	initialoutlay / (monthlyrevenue - monthlymaintenance) as repaytime 
	from 
		(select facs.name as name, 
			facs.initialoutlay as initialoutlay,
			facs.monthlymaintenance as monthlymaintenance,
			sum(case
				when memid = 0 then slots * facs.guestcost
				else slots * membercost
			end)/3 as monthlyrevenue
		from cd.bookings bks
		inner join cd.facilities facs
			on bks.facid = facs.facid
		group by facs.facid
	) as subq
order by name;

-- answer with cte

with monthdata as (
	select 	mincompletemonth,
		maxcompletemonth,
		(extract(year from maxcompletemonth)*12) +
			extract(month from maxcompletemonth) -
			(extract(year from mincompletemonth)*12) -
			extract(month from mincompletemonth) as nummonths 
	from (
		select 	date_trunc('month', 
				(select max(starttime) from cd.bookings)) as maxcompletemonth,
			date_trunc('month', 
				(select min(starttime) from cd.bookings)) as mincompletemonth
	) as subq
)
select 	name, 
	initialoutlay / (monthlyrevenue - monthlymaintenance) as repaytime 
	
	from
		(select facs.name as name,
			facs.initialoutlay as initialoutlay,
			facs.monthlymaintenance as monthlymaintenance,
			sum(case
				when memid = 0 then slots * facs.guestcost
				else slots * membercost
			end)/(select nummonths from monthdata) as monthlyrevenue
			
			from cd.bookings bks
			inner join cd.facilities facs
				on bks.facid = facs.facid
			where bks.starttime < (select maxcompletemonth from monthdata)
			group by facs.facid
		) as subq
order by name;
