1. distinct with aggregate only for 1 column

2. distinct on 2 or more columns will be displayed as composite value

    error: SELECT COUNT(DISTINCT department, name) as num_departments from products;
