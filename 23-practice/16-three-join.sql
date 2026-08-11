-- How can you produce a list of all members who have used a tennis court?
-- Include in your output the name of the court, and the name of the member formatted as a single column.
-- Ensure no duplicate data, and order by the member name followed by the facility name.

select distinct concat(firstname, ' ', surname) as member,
f.name as facility
from cd.members m
join cd.bookings b on b.memid = m.memid
join cd.facilities f on f.facid = b.facid
where f.name like '%Tennis Court%'
order by member, facility;

-- answer
select distinct mems.firstname || ' ' || mems.surname as member, facs.name as facility
	from
		cd.members mems
		inner join cd.bookings bks
			on mems.memid = bks.memid
		inner join cd.facilities facs
			on bks.facid = facs.facid
	where
		facs.name in ('Tennis Court 2','Tennis Court 1')
order by member, facility
