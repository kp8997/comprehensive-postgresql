-- How can you produce a list of the start times for bookings by members named 'David Farrell'?

select b.starttime from cd.bookings b
join cd.members m on m.memid = b.memid
where firstname = 'David' and surname = 'Farrell';

-- join with from and where

select bks.starttime
        from
                cd.bookings bks,
                cd.members mems
        where
                mems.firstname='David'
                and mems.surname='Farrell'
                and mems.memid = bks.memid;
