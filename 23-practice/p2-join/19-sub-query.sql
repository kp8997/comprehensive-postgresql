-- How can you output a list of all members, including the individual who recommended them (if any),
--  without using any joins?
-- Ensure that there are no duplicates in the list,
--  and that each firstname + surname pairing is formatted as a column and ordered.

select
distinct m.firstname || ' ' || m.surname as member,
case
	when m.recommendedby > 0 then (
		select rec.firstname || ' ' || rec.surname
		from cd.members rec
		where rec.memid = m.recommendedby
	)
	else ''
end as recommender
from cd.members m
order by member;

select
distinct on (m.firstname, m.surname)
m.firstname || ' ' || m.surname as member,
case
	when m.recommendedby > 0 then (
		select rec.firstname || ' ' || rec.surname
		from cd.members rec
		where rec.memid = m.recommendedby
  )
	else ''
end as recommender
from cd.members m
order by firstname, surname;

--- answer

select distinct mems.firstname || ' ' ||  mems.surname as member,
	(select recs.firstname || ' ' || recs.surname as recommender
		from cd.members recs
		where recs.memid = mems.recommendedby
	)
	from
		cd.members mems
order by member;

select
distinct on (m.firstname, m.surname)
m.firstname || ' ' || m.surname as member,
		(select rec.firstname || ' ' || rec.surname as recommender
		from cd.members rec
		where rec.memid = m.recommendedby)
from cd.members m
order by firstname, surname;
