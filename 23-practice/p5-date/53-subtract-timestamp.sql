-- Find the result of subtracting the timestamp '2012-07-30 01:00:00' from the timestamp '2012-08-31 01:00:00'

select '2012-08-31 01:00:00'::timestamp - '2012-07-30 01:00:00'::timestamp;

select ('2012-08-31 01:00:00'::date - '2012-07-30 01:00:00'::date || 'days')::interval;

-- timestamp - timestamp = interval (unit that have 'days' || 'month')
-- date - date = integer (in days unit but don't have 'days')
-- time - time = time
