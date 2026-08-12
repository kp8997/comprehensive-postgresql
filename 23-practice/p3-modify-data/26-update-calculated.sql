-- We want to alter the price of the second tennis court so that it costs 10% more than the first one.
-- Try to do this without using constant values for the prices, so that we can reuse the statement if we want to.

update cd.facilities f0
set membercost = (
    select membercost * 1.1
    from cd.facilities
    where facid = 0
  ),
  guestcost = (
    select f2.guestcost * 1.1
    from cd.facilities f2
    where f2.facid = 0
  )
where f0.facid = 1;

-- in this case alias doesn't matter for set
