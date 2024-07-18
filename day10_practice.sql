-- ex1
SELECT
        COUNTRY.Continent,
        FLOOR(AVG(CITY.Population)) AS avg_city_population
FROM CITY
        INNER JOIN COUNTRY
        ON CITY.CountryCode = COUNTRY.Code
GROUP BY
        COUNTRY.Continent;

-- ex2
SELECT
        ROUND(
          CAST(COUNT(texts.email_id) AS numeric)
          /COUNT(DISTINCT emails.email_id)
        , 2)
        AS activation_rate
FROM emails
        LEFT JOIN texts
        ON emails.email_id = texts.email_id
          AND texts.signup_action = 'Confirmed';

-- ex3
SELECT
        b.age_bucket,
-- time spent sending / total time
        ROUND(SUM(CASE WHEN a.activity_type = 'send' THEN a.time_spent ELSE 0 END)
            / SUM(a.time_spent) * 100.0
          , 2) AS send_perc,
-- time spent opening / total time
        ROUND(SUM(CASE WHEN a.activity_type = 'open' THEN a.time_spent ELSE 0 END)
            / SUM(a.time_spent) * 100.0
          , 2) AS open_perc
FROM activities AS a
        INNER JOIN age_breakdown AS b
        ON a.user_id = b.user_id
          AND a.activity_type IN ('send', 'open')
GROUP BY b.age_bucket;

-- ex4
SELECT 
        a.customer_id
FROM customer_contracts AS a
        INNER JOIN products AS b
        ON a.product_id = b.product_id
GROUP BY a.customer_id
HAVING COUNT(DISTINCT b.product_category) = 3;

-- ex5
SELECT 
        Managers.employee_id,
        Managers.name,
        COUNT(Employees.employee_id) AS reports_count,
        ROUND(AVG(Employees.age)) AS average_age
FROM Employees AS Managers
        LEFT JOIN Employees
        ON Managers.employee_id = Employees.reports_to
GROUP BY Managers.employee_id, Managers.name
HAVING reports_count != 0
ORDER BY Managers.employee_id

-- ex6
SELECT 
        b.product_name,
        SUM(a.unit) AS unit
FROM Orders AS a
        LEFT JOIN Products AS b
        ON a.product_id = b.product_id
WHERE
        EXTRACT(year FROM a.order_date) = 2020
        AND EXTRACT(month FROM a.order_date) = 2
GROUP BY b.product_name
HAVING SUM(a.unit) >= 100;

-- ex7
SELECT
        a.page_id
FROM pages AS a
        FULL JOIN page_likes AS b
        ON a.page_id = b.page_id
GROUP BY a.page_id
HAVING COUNT(b.user_id) = 0
ORDER BY a.page_id;
