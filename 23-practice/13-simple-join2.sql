-- How can you produce a list of the start times for bookings for tennis courts,
-- for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.

select b.starttime as start, f.name from cd.facilities f
join cd.bookings b on b.facid = f.facid
where b.starttime > '2012-09-21'
and b.starttime < '2012-09-22'
and f.name LIKE '%Tennis Court%'
order by b.starttime ASC;

-- alternation
select bks.starttime as start, facs.name as name
	from
		cd.facilities facs
		inner join cd.bookings bks
			on facs.facid = bks.facid
	where
		facs.name in ('Tennis Court 2','Tennis Court 1') and
		bks.starttime >= '2012-09-21' and
		bks.starttime < '2012-09-22'
order by bks.starttime;
