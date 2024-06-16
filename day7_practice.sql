-- ex1
SELECT Name
  FROM STUDENTS
  WHERE Marks > 75
  ORDER BY RIGHT(Name, 3) ASC, ID ASC;

-- ex2
SELECT user_id,
  UPPER(LEFT(name, 1)) || LOWER(RIGHT(name, LENGTH(name)-1)) AS name
  FROM Users
  ORDER BY user_id;

-- ex3
SELECT manufacturer,
  ('$' || ROUND(SUM(total_sales)/1000000) || ' million') AS sales_mil
  FROM pharmacy_sales
  GROUP BY manufacturer
  ORDER BY SUM(total_sales) DESC, manufacturer ASC;

-- ex4
SELECT EXTRACT(month FROM submit_date) AS month_of_year,
  product_id,
  ROUND(AVG(stars), 2)
  FROM reviews
  GROUP BY month_of_year, product_id
  ORDER BY month_of_year, product_id;

-- ex5
SELECT sender_id,
  COUNT(DISTINCT message_id) AS count_messages
  FROM messages
  WHERE EXTRACT(month FROM sent_date) = 8
  AND EXTRACT(year FROM sent_date) = 2022
  GROUP BY sender_id
  ORDER BY count_messages DESC
  LIMIT 2;

-- ex6
SELECT tweet_id
  FROM Tweets
  WHERE LENGTH(content) > 15;

-- ex7
SELECT activity_date AS day,
  COUNT(DISTINCT user_id) AS active_users
  FROM Activity
  WHERE activity_type != 'end-session'
  AND '2019-07-27'-activity_date <= 30
  GROUP BY activity_date;

-- ex8
SELECT count(DISTINCT id)
  FROM employees
  WHERE EXTRACT(month FROM joining_date) BETWEEN 1 AND 7
  AND EXTRACT(year FROM joining_date) = 2022

-- ex9
SELECT POSITION('a' IN first_name)
  FROM worker
  WHERE first_name = 'Amitah';

-- ex10
SELECT title,
  SUBSTRING(title, LENGTH(winery)+2, 4) AS vintage_year
  FROM winemag_p2;
