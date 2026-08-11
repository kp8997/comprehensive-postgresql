-- How can you output a list of all members, including the individual who recommended them (if any)?
-- Ensure that results are ordered by (surname, firstname).

select m.firstname as memfname,
m.surname as memsname,
rec.firstname as recfname,
rec.surname as recsname from cd.members rec
right join cd.members m on rec.memid = m.recommendedby
order by m.surname, m.firstname;

-- answer
select mems.firstname as memfname, mems.surname as memsname, recs.firstname as recfname, recs.surname as recsname
	from
		cd.members mems
		left outer join cd.members recs
			on recs.memid = mems.recommendedby
order by memsname, memfname;
