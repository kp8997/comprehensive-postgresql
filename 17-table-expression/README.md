syntax:
    WITH tags AS (
        query..
    )


Think of it like an alias with as. Purpose is like when using variable: 
    refer it anywhere for shorthand
    call in recursive query

syntax:
    WITH RECURSIVE variable_name(column1, column2,...) AS (
        seed_query
        UNION [ALL]
        recursive_query
    )
SELECT * FROM variable_name;

The seed_query is anchor member and only run once
The loop part with UNION running until the WHERE clause is false. For easily imagine, the where run first then the select run later.
