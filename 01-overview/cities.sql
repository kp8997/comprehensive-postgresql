create table cities (
    name VARCHAR(50),
    country VARCHAR(50),
    population INTEGER,
    area INTEGER
);

insert into cities 
values
    ('New York', 'USA', 8400000, 1214),
    ('Los Angeles', 'USA', 3900000, 1302),
    ('London', 'UK', 8900000, 1572),
    ('Tokyo', 'Japan', 13900000, 2194);

-- query with custom column and custom column name with 'as'

select concat(name, ' in ', country) as full_location from cities;
