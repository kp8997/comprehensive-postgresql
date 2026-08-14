-- Produce a list of the top three revenue generating facilities (including ties).
-- Output facility name and rank, sorted by rank and facility name.

select name, 
rank () over (order by sum(revenue) desc) 
from (
  select f.name,
  case
	  when b.memid = 0 then f.guestcost * b.slots
	  else f.membercost * b.slots
  end
  as revenue
  from cd.facilities f
  join cd.bookings b on b.facid = f.facid
)
group by name
limit 3

-- answer
select name, rank from (
	select facs.name as name, rank() over (order by sum(case
				when memid = 0 then slots * facs.guestcost
				else slots * membercost
			end) desc) as rank
		from cd.bookings bks
		inner join cd.facilities facs
			on bks.facid = facs.facid
		group by facs.name
	) as subq
	where rank <= 3
order by rank;
