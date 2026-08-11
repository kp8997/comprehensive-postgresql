-- You'd like to get the signup date of your last member. How can you retrieve this information?

select joindate as latest from cd.members
ORDER by joindate desc
LIMIT 1;

select firstname, surname, joindate from cd.members
where joindate = (select max(joindate) from cd.members);


-- select max(joindate) as latest
-- 	from cd.members;
