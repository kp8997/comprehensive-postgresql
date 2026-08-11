-- run this first
psql -f clubdata.sql -d postgres -x -q

\c exercises

SET search_path TO cd, public;

\dt

-- will see 3 tables: bookings, facilities, members. After that can start doing the practice problems below.
