-- Produce a list of each member name, id, and their first booking after September 1st 2012. Order by member ID.

select m.surname,
  m.firstname,
  m.memid,
  min(b.starttime)
from cd.members m
  join cd.bookings b on b.memid = m.memid
where b.starttime >= '2012-09-01'
group by surname,
  firstname,
  m.memid
order by memid;

-- answer
select mems.surname, mems.firstname, mems.memid, min(bks.starttime) as starttime
	from cd.bookings bks
	inner join cd.members mems on
		mems.memid = bks.memid
	where starttime >= '2012-09-01'
	group by mems.surname, mems.firstname, mems.memid
order by mems.memid;
