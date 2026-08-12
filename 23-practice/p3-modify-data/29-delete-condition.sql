-- In our previous exercises, we deleted a specific member who had never made a booking.
-- How can we make that more general, to delete all members who have never made a booking?


delete from cd.members m where m.memid NOT IN (
  select memid from cd.bookings
);

-- answer
-- advance because this will be more efficient than approach above

delete from cd.members mems where not exists (select 1 from cd.bookings where memid = mems.memid);
