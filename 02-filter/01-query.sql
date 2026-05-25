SELECT * FROM cities;

SELECT name, population FROM cities WHERE population > 5000000;

SELECT name, population FROM cities WHERE country = 'USA';

SELECT name, population FROM cities WHERE population BETWEEN 1000000 AND 2000000;

SELECT name, population, area FROM cities WHERE area <> 1302;

SELECT name, population, area FROM cities WHERE name IN ('Shanghai', 'Delhi', 'Tokyo');

SELECT name, population, area, population/area as density FROM cities WHERE (population/area) > 1000;
