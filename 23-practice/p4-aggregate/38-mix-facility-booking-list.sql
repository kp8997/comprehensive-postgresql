-- Produce a list of facilities along with their total revenue.
-- The output table should consist of facility name and revenue, sorted by revenue.
-- Remember that there's a different cost for guests and members!
select f.name as name,
  (
    case
      when b.memid = 0 then b.slots * f.guestcost
      else b.slots * f.membercost
    end
  ) as revenue
from cd.bookings b
  join cd.facilities f on f.facid = b.facid
group by name,
  revenue
order by revenue;
-- answer -- different is they let cost outside the case when
select facs.name,
  sum(
    slots * case
      when memid = 0 then facs.guestcost
      else facs.membercost
    end
  ) as revenue
from cd.bookings bks
  inner join cd.facilities facs on bks.facid = facs.facid
group by facs.name
order by revenue;
