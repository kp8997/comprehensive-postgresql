-- How can you output a list of all members who have recommended another member?
-- Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).

select distinct firstname, surname from cd.members
where memid in (
  select recommendedby from cd.members
  where recommendedby > 0
)
order by surname, firstname;

-- another way with self join
SELECT DISTINCT
    m1.firstname,
    m1.surname
FROM cd.members m1
INNER JOIN cd.members m2
    ON m1.memid = m2.recommendedby
ORDER BY surname, firstname;
