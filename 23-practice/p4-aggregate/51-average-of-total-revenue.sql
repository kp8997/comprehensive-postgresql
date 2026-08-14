-- For each day in August 2012, calculate a rolling average of total revenue over the previous 15 days.
-- Output should contain date and revenue columns, sorted by the date.
-- Remember to account for the possibility of a day having zero revenue. 
-- This one's a bit tough, so don't be afraid to check out the hint!
select dategen.date,
  (
    -- correlated subquery that, for each day fed into it,
    -- finds the average revenue for the last 15 days
    select sum(
        case
          when memid = 0 then slots * facs.guestcost
          else slots * membercost
        end
      ) as rev
    from cd.bookings bks
      inner join cd.facilities facs on bks.facid = facs.facid
    where bks.starttime > dategen.date - interval '14 days'
      and bks.starttime < dategen.date + interval '1 day'
  ) / 15 as revenue
from (
    -- generates a list of days in august
    select cast(
        generate_series(timestamp '2012-08-01', '2012-08-31', '1 day') as date
      ) as date
  ) as dategen
order by dategen.date;
-- answer
select date,
  avgrev
from (
    -- AVG over this row and the 14 rows before it.
    select dategen.date as date,
      avg(revdata.rev) over(
        order by dategen.date rows 14 preceding
      ) as avgrev
    from -- generate a list of days.  This ensures that a row gets generated
      -- even if the day has 0 revenue.  Note that we generate days before
      -- the start of october - this is because our window function needs
      -- to know the revenue for those days for its calculations.
      (
        select cast(
            generate_series(timestamp '2012-07-10', '2012-08-31', '1 day') as date
          ) as date
      ) as dategen
      left outer join -- left join to a table of per-day revenue
      (
        select cast(bks.starttime as date) as date,
          sum(
            case
              when memid = 0 then slots * facs.guestcost
              else slots * membercost
            end
          ) as rev
        from cd.bookings bks
          inner join cd.facilities facs on bks.facid = facs.facid
        group by cast(bks.starttime as date)
      ) as revdata on dategen.date = revdata.date
  ) as subq
where date >= '2012-08-01'
order by date;
