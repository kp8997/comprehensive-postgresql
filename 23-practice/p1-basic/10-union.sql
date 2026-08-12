-- You, for some reason, want a combined list of all surnames and all facility names.
-- Yes, this is a contrived example :-). Produce that list!

(select name as Stibbons from cd.facilities)
UNION
(select surname as Stibbons from cd.members);
