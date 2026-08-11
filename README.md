With as alias_name (
query
)

Select
(function + column) column as alias
aggregate: group, min, max, count, avg
subquery: select ...
distinct
utility: greatest, least
case
    when condition: then value
    when … then …
    else …
end

From
table
subquery

Where
condition: >, >=, <, <=, =, <>, IN, NOT IN, LIKE
subquery

Join
table1 ON field1 = field2
join table2
on field1 = field2 and field3 =field 4

Group by
column

Order by
column

Limit
number

Offset
number

Subquery (
Select
From

    Where

    Join

    Group by

    Order by

    Limit

    Offset

)

================================

5 types of constraint
    primary
    foreign
    check
    not null
    unique

4 ways to add constraint
    at creation
        table level
        column level
    after creation
        table level
        column level

    table level is able to specify name of constraint
    column level automatically named by postgresql

================================
