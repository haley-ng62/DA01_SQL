-- ex1
SELECT DISTINCT CITY
FROM STATION
WHERE ID%2=0;

-- ex2
SELECT
  COUNT(*) - COUNT(DISTINCT CITY)
FROM STATION;

-- ex3
SELECT
  CEILING(AVG(SALARY) - AVG(REPLACE(SALARY, '0', '')))
FROM EMPLOYEES;

-- ex4
SELECT
  ROUND(
    CAST(SUM(item_count*order_occurrences)
    /SUM(order_occurrences) AS DECIMAL)
  ,1)
FROM items_per_order;

-- ex5
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;

-- ex6
SELECT
  user_id
  , MAX(DATE(post_date)) - MIN(DATE(post_date))
FROM posts
WHERE DATE(post_date) BETWEEN '2021-01-01' AND '2022-01-01'
GROUP BY user_id
HAVING COUNT(post_date) > 2;

-- ex7
SELECT card_name
  , MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC;

-- ex8
SELECT 
  manufacturer
  , COUNT(drug)
  , SUM(ABS(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales - cogs < 0
GROUP BY manufacturer
ORDER BY total_loss DESC;

-- ex9
SELECT *
FROM Cinema
WHERE id%2=1
  AND NOT description LIKE '%boring%'
ORDER BY rating DESC;

-- ex10
SELECT teacher_id
  , COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;

-- ex11
SELECT DISTINCT
  user_id
  , COUNT(DISTINCT follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

-- ex12
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
