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

-- ex6
SELECT user_id,
MAX(DATE(post_date)) - MIN(DATE(post_date))
FROM posts
WHERE DATE(post_date) BETWEEN '2021-01-01' AND '2022-01-01'
GROUP BY user_id
HAVING COUNT(post_date) > 2;

-- ex7
