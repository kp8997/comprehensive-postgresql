-- Produce a monotonically increasing numbered list of members (including guests), ordered by their date of joining.
-- Remember that member IDs are not guaranteed to be sequential.
select row_number() over () as count,
  firstname,
  surname
from cd.members

-- similar

select row_number() over (order by joindate) as count,
  firstname,
  surname
from cd.members

-- similar
select row_number() over(),
  firstname,
  surname
from cd.members
order by joindate


-- answer

select row_number() over(
    order by joindate
  ),
  firstname,
  surname
from cd.members
order by joindate
