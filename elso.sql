SELECT * FROM registration LIMIT 10;

SELECT country, source, COUNT(*) AS sc
FROM registration
GROUP BY country, source
ORDER BY country, sc DESC;

SELECT my_date, COUNT (*)
FROM registration
GROUP BY my_date
