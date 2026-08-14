-- You'd like to produce a count of how many members you have whose surname starts with each letter of the alphabet.
-- Sort by the letter, and don't worry about printing out a letter if the count is 0.
select substring(
    surname
    from 1 for 1
  ) as letter,
  count(*)
from cd.members
group by letter
order by letter;

-- answer

select substr (mems.surname, 1, 1) as letter,
  count(*) as count
from cd.members mems
group by letter
order by letter;
