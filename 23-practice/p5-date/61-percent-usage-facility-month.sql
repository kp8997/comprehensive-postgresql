-- Work out the utilisation percentage for each facility by month, sorted by name and month,
--  rounded to 1 decimal place. Opening time is 8am, closing time is 8.30pm. 
-- You can treat every month as a full month, regardless of if there were some dates the club was not open.
select f.name,
  date_trunc('month', b.starttime) as month,
  round(
    (
      (
        (sum(b.slots) * 4) / (
          (
            date_trunc('month', b.starttime) + interval '1 month'
          )::date - date_trunc('month', b.starttime)::date
        )::numeric
      )
    ),
    1
  ) as slots_in_month
from cd.bookings b
  join cd.facilities f on f.facid = b.facid
group by f.name,
  month
order by f.name,
  month;

-- answer

select name, month, 
	round((100*slots)/
		cast(
			25*(cast((month + interval '1 month') as date)
			- cast (month as date)) as numeric),1) as utilisation
	from  (
		select facs.name as name, date_trunc('month', starttime) as month, sum(slots) as slots
			from cd.bookings bks
			inner join cd.facilities facs
				on bks.facid = facs.facid
			group by facs.facid, month
	) as inn
order by name, month 
