-- Starting off with just some simple code to be able to see each table.

SELECT *
FROM aqi_2020_2;

SELECT *
FROM aqi_2019_2;

SELECT *
FROM aqi_2018_2;

SELECT *
FROM aqi_2017_2;

SELECT *
FROM aqi_2016_2;

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
SELECT ROUND(AVG(CAST(a.aqi as int)), 2) AS avg_aqi_2020, a.city
FROM aqi_2020_2 as a
JOIN us_city_populations3 as c
ON a.city = c.city
WHERE CAST(c.y2019 as int) > 250000
GROUP BY a.city, c.y2019
ORDER BY avg_aqi_2020
LIMIT 5

-- 2020 worst
SELECT ROUND(AVG(CAST(a.aqi as int)), 2) AS avg_aqi, a.city
FROM aqi_2020 as a
JOIN us_city_populations2 as c
ON a.city = c.city
WHERE CAST(c.y2019 as int) > 250000
GROUP BY a.city, c.y2019
ORDER BY avg_aqi DESC
LIMIT 5

-- 2019 best
SELECT ROUND(AVG(CAST(a.aqi as int)), 2) AS avg_aqi_2019, a.city
FROM aqi_2019_2 as a
JOIN us_city_populations2 as c
ON a.city = c.city
WHERE CAST(c.y2019 as int) > 250000
GROUP BY a.city, c.y2019
ORDER BY avg_aqi_2019
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
SELECT ROUND(AVG(CAST(a.aqi as int)), 2) AS avg_aqi_2018, a.city
FROM aqi_2018_2 as a
JOIN us_city_populations2 as c
ON a.city = c.city
WHERE CAST(c.y2019 as int) > 250000
GROUP BY a.city, c.y2018
ORDER BY avg_aqi_2018
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
SELECT ROUND(AVG(CAST(a.aqi as int)), 2) AS avg_aqi_2017, a.city
FROM aqi_2017_2 as a
JOIN us_city_populations2 as c
ON a.city = c.city
WHERE CAST(c.y2019 as int) > 250000
GROUP BY a.city, c.y2017
ORDER BY avg_aqi_2017
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
SELECT ROUND(AVG(CAST(a.aqi as int)), 2) AS avg_aqi_2016, a.city
FROM aqi_2016_2 as a
JOIN us_city_populations2 as c
ON a.city = c.city
WHERE CAST(c.y2019 as int) > 250000
GROUP BY a.city, c.y2016
ORDER BY avg_aqi_2016
LIMIT 5

-- 2016 worst
SELECT ROUND(AVG(CAST(a.aqi as int)), 2) 
		AS avg_aqi, a.city, CAST(c.y2016 as int)
	FROM aqi_2016_2 as a
	JOIN us_city_populations2 as c
		ON a.city = c.city
	WHERE CAST(c.y2019 as int) > 250000
GROUP BY a.city, c.y2016
ORDER BY avg_aqi DESC
LIMIT 5

-- In the above, I thought LA would be in there, but apparently it's not included in the aqi data sets. JK, I had to clean the data more.

-- Trying to group by month and see if there is a month that is higher.

-- The query below went for like 10 mins and wouldn't finish.
SELECT DATE_TRUNC('month', a.date) AS month_number,
		ROUND(AVG(CAST(a.aqi as int)), 2) AS avg_aqi_2016,
		ROUND(AVG(CAST(t.aqi as int)), 2) AS avg_aqi_2017,
		ROUND(AVG(CAST(m.aqi as int)), 2) AS avg_aqi_2018,
		ROUND(AVG(CAST(p.aqi as int)), 2) AS avg_aqi_2019,
		ROUND(AVG(CAST(k.aqi as int)), 2) AS avg_aqi_2020
	FROM aqi_2016_2 as a
	JOIN aqi_2017_2 as t
		ON a.city = t.city
	JOIN aqi_2018_2 as m
		ON t.city = m.city
	JOIN aqi_2019_2 as p
		ON m.city = p.city
	JOIN aqi_2020_2 as k
		ON p.city = k.city
GROUP BY DATE_TRUNC('month', a.date);

-- Doing it in separate queries

-- 2020
SELECT DATE_TRUNC('month', date) AS month_number,
		ROUND(AVG(CAST(aqi as int)), 2) AS avg_aqi_2020
	FROM aqi_2020_2
GROUP BY DATE_TRUNC('month', date);

-- 2019
SELECT DATE_TRUNC('month', date) AS month_number,
		ROUND(AVG(CAST(aqi as int)), 2) AS avg_aqi_2019
	FROM aqi_2019_2
GROUP BY DATE_TRUNC('month', date);

-- 2018
SELECT DATE_TRUNC('month', date) AS month_number,
		ROUND(AVG(CAST(aqi as int)), 2) AS avg_aqi_2018
	FROM aqi_2018_2
GROUP BY DATE_TRUNC('month', date);

-- 2017
SELECT DATE_TRUNC('month', date) AS month_number,
		ROUND(AVG(CAST(aqi as int)), 2) AS avg_aqi_20217
	FROM aqi_2017_2
GROUP BY DATE_TRUNC('month', date);

-- 2016
SELECT DATE_TRUNC('month', date) AS month_number,
		ROUND(AVG(CAST(aqi as int)), 2) AS avg_aqi_2016
	FROM aqi_2016_2
GROUP BY DATE_TRUNC('month', date);

-- Just the worst of 2020 by month
SELECT DATE_TRUNC('month', date) AS month_number,
		ROUND(AVG(CAST(aqi as int)), 2) AS avg_aqi_2020
	FROM aqi_2020_2
	WHERE city IN ('Riverside, CA', 'Los Angeles, CA', 'Phoenix, AZ', 'Fresno, CA', 'Denver, CO')
GROUP BY DATE_TRUNC('month', date);

SELECT DATE_TRUNC('month', date) AS month_number,
		ROUND(AVG(CAST(aqi as int)), 2) AS riverside_ca_avg_2020
	FROM aqi_2020_2
	WHERE city IN ('Riverside, CA')
GROUP BY DATE_TRUNC('month', date), city;

SELECT DATE_TRUNC('month', date) AS month_number,
		ROUND(AVG(CAST(aqi as int)), 2) AS losangeles_ca_avg_2020
	FROM aqi_2020_2
	WHERE city IN ('Los Angeles, CA')
GROUP BY DATE_TRUNC('month', date), city;

SELECT DATE_TRUNC('month', date) AS month_number,
		ROUND(AVG(CAST(aqi as int)), 2) AS phoenix_az_avg_2020
	FROM aqi_2020_2
	WHERE city IN ('Phoenix, AZ')
GROUP BY DATE_TRUNC('month', date), city;

SELECT DATE_TRUNC('month', date) AS month_number,
		ROUND(AVG(CAST(aqi as int)), 2) AS fresno_ca_avg_2020
	FROM aqi_2020_2
	WHERE city IN ('Fresno, CA')
GROUP BY DATE_TRUNC('month', date), city;

SELECT DATE_TRUNC('month', date) AS month_number,
		ROUND(AVG(CAST(aqi as int)), 2) AS denver_co_avg_2020
	FROM aqi_2020_2
	WHERE city IN ('Denver, CO')
GROUP BY DATE_TRUNC('month', date), city;

SELECT DATE_TRUNC('month', date) AS month_number,
		ROUND(AVG(CAST(aqi as int)), 2) AS nashville_tn_avg_2020
	FROM aqi_2020_2
	WHERE city IN ('Nashville, TN')
GROUP BY DATE_TRUNC('month', date), city;

-- Now looking at greatest improvement over time

-- 2020
SELECT ROUND(AVG(CAST(aqi as int)), 2) AS avg_aqi_2020_all, city, COUNT(city) as times_tested
FROM aqi_2020_2
GROUP BY city
HAVING COUNT(city) > 100
ORDER BY avg_aqi_2020_all

-- 2019
SELECT ROUND(AVG(CAST(aqi as int)), 2) AS avg_aqi_2019_all, city, COUNT(city) as times_tested
FROM aqi_2019_2
GROUP BY city
HAVING COUNT(city) > 100
ORDER BY avg_aqi_2019_all

-- 2018
SELECT ROUND(AVG(CAST(aqi as int)), 2) AS avg_aqi_2018_all, city, COUNT(city) as times_tested
FROM aqi_2018_2
GROUP BY city
HAVING COUNT(city) > 100
ORDER BY avg_aqi_2018_all

-- 2017
SELECT ROUND(AVG(CAST(aqi as int)), 2) AS avg_aqi_2017_all, city, COUNT(city) as times_tested
FROM aqi_2017_2
GROUP BY city
HAVING COUNT(city) > 100
ORDER BY avg_aqi_2017_all

-- 2016
SELECT ROUND(AVG(CAST(aqi as int)), 2) AS avg_aqi_2016_all, city, COUNT(city) as times_tested
FROM aqi_2016_2
GROUP BY city
HAVING COUNT(city) > 100
ORDER BY avg_aqi_2016_all

-- Trying to do the above with just one query... Took forever and didn't complete after 5 mins so I cancelled.
SELECT a.city,
		ROUND(AVG(CAST(a.aqi as int)), 2) AS avg_aqi_2016,
		ROUND(AVG(CAST(t.aqi as int)), 2) AS avg_aqi_2017,
		ROUND(AVG(CAST(m.aqi as int)), 2) AS avg_aqi_2018,
		ROUND(AVG(CAST(p.aqi as int)), 2) AS avg_aqi_2019,
		ROUND(AVG(CAST(k.aqi as int)), 2) AS avg_aqi_2020
	FROM aqi_2016_2 as a
	JOIN aqi_2017_2 as t
		ON a.city = t.city
	JOIN aqi_2018_2 as m
		ON t.city = m.city
	JOIN aqi_2019_2 as p
		ON m.city = p.city
	JOIN aqi_2020_2 as k
		ON p.city = k.city
GROUP BY a.city
HAVING COUNT(a.city) > 100