-- Output the facility id that has the highest number of slots booked.
-- Ensure that in the event of a tie, all tieing results get output.

select facid,
  sum(slots) as total
from cd.bookings
group by facid
having sum(slots) = (
    select max(total)
    from (
        select facid,
          sum(slots) as total
        from cd.bookings
        group by facid
        order by facid
      )
  )

-- with rank()

select facid,
  total
from (
    select facid,
      sum(slots) total,
      rank() over (
        order by sum(slots) desc
      ) rank
    from cd.bookings
    group by facid
  ) as ranked
where rank = 1
