-- Get the day of the month from the timestamp '2012-08-31' as an integer.

select to_char('2012-08-31'::timestamp, 'DD');

select extract('day' from '2012-08-31'::timestamp);

-- answer
select extract(day from timestamp '2012-08-31');
