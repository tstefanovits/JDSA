SELECT *
FROM zoo;

SELECT *
FROM zoo_eats;

--Ez az alap join
SELECT *
FROM zoo
  JOIN zoo_eats ON zoo.animal = zoo_eats.animal;

--Full join
SELECT *
FROM zoo
  FULL JOIN zoo_eats ON zoo.animal = zoo_eats.animal;

--BAL oldali (els? tábla)
SELECT *
FROM zoo
  LEFT JOIN zoo_eats ON zoo.animal = zoo_eats.animal;

--Jobb oldali
SELECT *
FROM zoo
  RIGHT JOIN zoo_eats ON zoo.animal = zoo_eats.animal;

--1. feladat
SELECT *
FROM accidents
  JOIN date_table ON accidents.accident_date = date_table.accident_date LIMIT 10;

--2. feladat
SELECT date_table.dow(*),
       COUNT(*) AS acc_by_day
FROM accidents
  JOIN date_table ON accidents.accident_date = date_table.accident_date
GROUP BY date_table.dow
ORDER BY acc_by_day DESC LIMIT 10;

--3. feladat
SELECT country,
       COUNT(*) AS acc_by_country
FROM accidents
  JOIN covered_by_insurance ON accidents.accident_id = covered_by_insurance.accident_id
WHERE paid = 'true'
AND   accidents.country IS NOT NULL
GROUP BY accidents.country
ORDER BY acc_by_country DESC LIMIT 5;

--SUBQUERIES
SELECT COUNT(*)
FROM (SELECT animal,
             SUM(water_need) AS sum_water
      FROM zoo
      GROUP BY animal) AS sum_water_animal
WHERE sum_water_animal.sum_water > 1600;

SELECT animal,
       SUM(water_need) AS sum_water
FROM zoo
GROUP BY animal
HAVING SUM(water_need) > 1600;

--1. feladat
SELECT COUNT(*) FROM 
(SELECT COUNT(*) AS count_city, city
FROM accidents
GROUP BY city) AS acc_city
WHERE count_city <40;

--2. feladat
SELECT MAX(osszkar) / SUM(osszkar) * 100
FROM 
  (SELECT country, SUM(damage) AS osszkar

SELECT MAX(osszkar) FROM
(SELECT country,SUM(damage) AS osszkar
FROM accidents
GROUP BY country) AS akarmi;

--32. feladat a házi!

