-- Produce a list of the total number of hours booked per facility, remembering that a slot lasts half an hour.
-- The output table should consist of the facility id, name, and hours booked, sorted by facility id.
-- Try formatting the hours to two decimal places.
select b.facid,
  f.name,
  ROUND(sum(b.slots)::numeric / 2.0, 2) as "Total Hours"
from cd.bookings b
  join cd.facilities f on f.facid = b.facid
group by b.facid,
  f.name
order by facid;

-- answer

select facs.facid,
  facs.name,
  trim(
    to_char(sum(bks.slots) / 2.0, '9999999999999999D99')
  ) as "Total Hours"
from cd.bookings bks
  inner join cd.facilities facs on facs.facid = bks.facid
group by facs.facid,
  facs.name
order by facs.facid;
