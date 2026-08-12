-- You'd like to get the first and last name of the last member(s) who signed up - not just the date.
-- How can you do that?

select firstname, surname, joindate from cd.members
where joindate = (select max(joindate) from cd.members);

-- answer

select firstname, surname, joindate
	from cd.members
order by joindate desc
limit 1;

select firstname, surname, joindate
	from cd.members
	where joindate =
		(select max(joindate)
			from cd.members);
