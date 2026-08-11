-- How can you produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) more than $30?
-- Remember that guests have different costs to members (the listed costs are per half-hour 'slot'), and the guest user is always ID 0.
-- Include in your output the name of the facility, the name of the member formatted as a single column, and the cost.
-- Order by descending cost, and do not use any subqueries.

select
m.firstname || ' ' || m.surname as member,
f.name as facility,
case
	when m.memid = 0 then f.guestcost * b.slots
	else f.membercost * b.slots
end as cost
from cd.bookings b
join cd.facilities f on f.facid = b.facid
join cd.members m on m.memid = b.memid
where b.starttime > '2012-09-14' and b.starttime < '2012-09-15'
and ((b.slots * f.membercost > 30 and m.memid != 0)
	 or (b.slots * f.guestcost > 30 and m.memid = 0))
order by cost desc;

-- answer

select mems.firstname || ' ' || mems.surname as member,
	facs.name as facility,
	case
		when mems.memid = 0 then
			bks.slots*facs.guestcost
		else
			bks.slots*facs.membercost
	end as cost
        from
                cd.members mems
                inner join cd.bookings bks
                        on mems.memid = bks.memid
                inner join cd.facilities facs
                        on bks.facid = facs.facid
        where
		bks.starttime >= '2012-09-14' and 
		bks.starttime < '2012-09-15' and (
			(mems.memid = 0 and bks.slots*facs.guestcost > 30) or
			(mems.memid != 0 and bks.slots*facs.membercost > 30)
		)
order by cost desc;
