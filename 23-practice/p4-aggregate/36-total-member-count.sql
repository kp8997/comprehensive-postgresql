-- Find the total number of members (including guests) who have made at least one booking.

select count(distinct memid) from cd.bookings;

-- remember that count + distinct are able to mix together
