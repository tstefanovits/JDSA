--1.feladat
SELECT source, COUNT(*) source_count
FROM registration
GROUP BY source
ORDER BY source_count DESC;

--2.feladat
SELECT COUNT(*), source
FROM registration
JOIN super_tree
ON registration.user_id = super_tree.use_id;

--3.feladat
SELECT SUM(revenue) FROM
(SELECT user_id, COUNT(*) AS super_tree_sends, COUNT(*)-1 AS revenue
FROM super_tree
GROUP BY user_id) AS akarmi;

SELECT COUNT(*)-COUNT(DISTINCT(user_id)) AS revenue
FROM super_tree;
