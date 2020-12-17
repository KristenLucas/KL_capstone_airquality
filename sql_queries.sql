-- Starting off with just some simple code to be able to see each table.

SELECT *
FROM aqi_2020;

SELECT *
FROM aqi_2019;

SELECT *
FROM aqi_2018;

SELECT *
FROM aqi_2017;

SELECT *
FROM aqi_2016;

SELECT *
FROM us_city_populations;

-- Trying out a few other things.

SELECT *
FROM aqi_2020
WHERE city ILIKE 'Nashville%';

-- Trying some joins.

SELECT DISTINCT a.city, c.y2019
FROM aqi_2020 as a
JOIN us_city_populations as c
ON a.city = c.city