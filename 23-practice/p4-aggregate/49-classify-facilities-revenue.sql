-- Classify facilities into equally sized groups of high, average, and low based on their revenue.
-- Order by classification and facility name.
select name,
  case
    when revenue = 3 then 'high'
    when revenue = 2 then 'average'
    else 'low'
  end as revenue
from (
    select f.name,
      ntile (3) over (
        order by sum(
            case
              when b.memid = 0 then f.guestcost * b.slots
              else b.slots * f.membercost
            end
          ) asc
      ) as revenue
    from cd.facilities f
      join cd.bookings b on b.facid = f.facid
    group by f.facid
    order by revenue desc,
      name asc
  ) 
  
-- note that ntile() divide into N groups equally, based on the order by
-- in this case, it divides the facilities into 3 groups based on their revenue
-- and the facility with the highest revenue will be in the first group

-- remember order in ntile over will give the number desc or asc
-- we have to sort 2 more layers when reaching the right answer

-- answer
select name, case when class=1 then 'high'
		when class=2 then 'average'
		else 'low'
		end revenue
	from (
		select facs.name as name, ntile(3) over (order by sum(case
				when memid = 0 then slots * facs.guestcost
				else slots * membercost
			end) desc) as class
		from cd.bookings bks
		inner join cd.facilities facs
			on bks.facid = facs.facid
		group by facs.name
	) as subq
order by class, name;
