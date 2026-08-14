-- For each month of the year in 2012, output the number of days in that month. Format the output as an integer column containing the month of the year,
--  and a second column containing an interval data type.
select extract(
    month
    from month_column
  ) as month,
  (list.month_column + interval '1 month') - list.month_column as days
from (
    select generate_series(
        '2012-01-01'::timestamp,
        '2012-12-01'::timestamp,
        interval '1 month'
      ) as month_column
  ) list 
-- answer
select extract(
    month
    from cal.month
  ) as month,
  (cal.month + interval '1 month') - cal.month as length
from (
    select generate_series(
        timestamp '2012-01-01',
        timestamp '2012-12-01',
        interval '1 month'
      ) as month
  ) cal
order by month;
