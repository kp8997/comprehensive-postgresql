1. group then we can only select those fields in group clause

2. aggregate functions such as COUNT, SUM, MIN, MAX, AVG can use in the select clause with only fields in group clause

* if we want to select other fields, we need to add them into the group clause

* normal select will treat as the big group (no group by clause) so that can be used with aggregate functions

* id is always implicitly added to group clause
