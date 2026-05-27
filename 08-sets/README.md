1. UNION must have the same type result between 2 / many queries
  
-- select name, price from products 

-- select price, name from products 

These two are not valid to union

UNION will remove duplicate values. to list all add 'ALL'

2. INTERSECT and EXCEPT are on the same rule as UNION 
