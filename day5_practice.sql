-- ex1
SELECT DISTINCT CITY
FROM STATION
WHERE ID%2=0;

-- ex2
SELECT COUNT(*) - COUNT(DISTINCT CITY)
FROM STATION;

-- ex3
SELECT CEILING(AVG(SALARY) - AVG(REPLACE(SALARY, '0', '')))
FROM EMPLOYEES;

-- ex4
SELECT
ROUND(CAST(SUM(item_count*order_occurrences)/SUM(order_occurrences) AS DECIMAL),1)
FROM items_per_order;

-- ex5
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;
