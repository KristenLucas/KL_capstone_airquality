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

SELECT *
FROM us_city_populations2;

SELECT *
FROM us_city_populations3;

-- Trying out a few other things.

SELECT *
FROM aqi_2020_2
WHERE city ILIKE '%New York%';

-- Trying some joins.

SELECT DISTINCT a.city, c.y2019
FROM aqi_2020 as a
JOIN us_city_populations3 as c
ON a.city = c.city
WHERE a.city ILIKE '%Nashville%';


-- Below is where I start to look at the best average air quality for the year in large cities in the US.

-- 2020 best

SELECT ROUND(AVG(CAST(a.aqi as int)), 2) AS avg_aqi, a.city, CAST(c.y2019 as int)
FROM aqi_2020_2 as a
JOIN us_city_populations3 as c
ON a.city = c.city
WHERE CAST(c.y2019 as int) > 250000
GROUP BY a.city, c.y2019
ORDER BY avg_aqi
LIMIT 5

-- 2020 worst

SELECT ROUND(AVG(CAST(a.aqi as int)), 2) AS avg_aqi, a.city, CAST(c.y2019 as int)
FROM aqi_2020 as a
JOIN us_city_populations2 as c
ON a.city = c.city
WHERE CAST(c.y2019 as int) > 250000
GROUP BY a.city, c.y2019
ORDER BY avg_aqi DESC
LIMIT 5

-- 2019 best

SELECT ROUND(AVG(CAST(a.aqi as int)), 2) AS avg_aqi, a.city, CAST(c.y2019 as int)
FROM aqi_2019_2 as a
JOIN us_city_populations2 as c
ON a.city = c.city
WHERE CAST(c.y2019 as int) > 250000
GROUP BY a.city, c.y2019
ORDER BY avg_aqi
LIMIT 5

-- 2019 worst

SELECT ROUND(AVG(CAST(a.aqi as int)), 2) AS avg_aqi, a.city, CAST(c.y2019 as int)
FROM aqi_2019_2 as a
JOIN us_city_populations2 as c
ON a.city = c.city
WHERE CAST(c.y2019 as int) > 250000
GROUP BY a.city, c.y2019
ORDER BY avg_aqi DESC
LIMIT 5

-- 2018 best

SELECT ROUND(AVG(CAST(a.aqi as int)), 2) AS avg_aqi, a.city, CAST(c.y2018 as int)
FROM aqi_2018_2 as a
JOIN us_city_populations2 as c
ON a.city = c.city
WHERE CAST(c.y2019 as int) > 250000
GROUP BY a.city, c.y2018
ORDER BY avg_aqi
LIMIT 5

-- 2018 worst

SELECT ROUND(AVG(CAST(a.aqi as int)), 2) AS avg_aqi, a.city, CAST(c.y2018 as int)
FROM aqi_2018_2 as a
JOIN us_city_populations2 as c
ON a.city = c.city
WHERE CAST(c.y2019 as int) > 250000
GROUP BY a.city, c.y2018
ORDER BY avg_aqi DESC
LIMIT 5

-- 2017 best

SELECT ROUND(AVG(CAST(a.aqi as int)), 2) AS avg_aqi, a.city, CAST(c.y2017 as int)
FROM aqi_2017_2 as a
JOIN us_city_populations2 as c
ON a.city = c.city
WHERE CAST(c.y2019 as int) > 250000
GROUP BY a.city, c.y2017
ORDER BY avg_aqi
LIMIT 5

-- 2017 worst

SELECT ROUND(AVG(CAST(a.aqi as int)), 2) AS avg_aqi, a.city, CAST(c.y2017 as int)
FROM aqi_2017_2 as a
JOIN us_city_populations2 as c
ON a.city = c.city
WHERE CAST(c.y2019 as int) > 250000
GROUP BY a.city, c.y2017
ORDER BY avg_aqi DESC
LIMIT 5

-- 2016 best

SELECT ROUND(AVG(CAST(a.aqi as int)), 2) AS avg_aqi, a.city, CAST(c.y2016 as int)
FROM aqi_2016_2 as a
JOIN us_city_populations2 as c
ON a.city = c.city
WHERE CAST(c.y2019 as int) > 250000
GROUP BY a.city, c.y2016
ORDER BY avg_aqi
LIMIT 5

-- 2016 worst

SELECT ROUND(AVG(CAST(a.aqi as int)), 2) AS avg_aqi, a.city, CAST(c.y2016 as int)
FROM aqi_2016_2 as a
JOIN us_city_populations2 as c
ON a.city = c.city
WHERE CAST(c.y2019 as int) > 250000
GROUP BY a.city, c.y2016
ORDER BY avg_aqi DESC
LIMIT 5

-- In the above, I thought LA would be in there, but apparently it's not included in the aqi data sets. JK, I had to clean the data more.