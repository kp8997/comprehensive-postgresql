-- Produce a list of facilities with a total revenue less than 1000.
-- Produce an output table consisting of facility name and revenue, sorted by revenue.
-- Remember that there's a different cost for guests and members!
select name,
  revenue
from (
    select f.name as name,
      sum(
        b.slots * case
          when b.memid = 0 then f.guestcost
          else f.membercost
        end
      ) as revenue
    from cd.bookings b
      join cd.facilities f on f.facid = b.facid
    group by name
    order by revenue
  )
where revenue < 1000;
-- answer

select name, revenue from (
	select facs.name, sum(case 
				when memid = 0 then slots * facs.guestcost
				else slots * membercost
			end) as revenue
		from cd.bookings bks
		inner join cd.facilities facs
			on bks.facid = facs.facid
		group by facs.name
	) as agg where revenue < 1000
order by revenue;

-- or with more verbose because of duplicate revenue calculation

select facs.name, sum(case 
		when memid = 0 then slots * facs.guestcost
		else slots * membercost
	end) as revenue
	from cd.bookings bks
	inner join cd.facilities facs
		on bks.facid = facs.facid
	group by facs.name
	having sum(case 
		when memid = 0 then slots * facs.guestcost
		else slots * membercost
	end) < 1000
order by revenue;
