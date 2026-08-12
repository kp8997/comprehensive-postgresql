-- Produce a list of the total number of slots booked per facility.
-- For now, just produce an output table consisting of facility id and slots, sorted by facility id.

select f.facid, sum(slots) as "Total Slots" from cd.facilities f
join cd.bookings b on b.facid = f.facid
group by f.facid
order by facid;

-- answer

select facid, sum(slots) as "Total Slots"
	from cd.bookings
	group by facid
order by facid;
