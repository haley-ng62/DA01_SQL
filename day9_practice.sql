-- ex1
SELECT
  SUM(CASE
    WHEN device_type = 'laptop' THEN 1
    ELSE 0
  END) AS laptop_reviews,
  SUM(CASE
    WHEN device_type = 'tablet' OR device_type = 'phone' THEN 1
    ELSE 0
  END) AS mobile_reviews
FROM viewership;

-- ex2
SELECT x, y, z,
  CASE
    WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
    ELSE 'No'
  END AS triangle
FROM Triangle;

-- ex3
ROUND(100.0 *
  COUNT(CASE
    WHEN call_category = 'n/a'
      OR call_category IS NULL THEN case_id
    ELSE NULL
  END) / COUNT(*), 1)
  AS uncategorised_call_pct
FROM callers;

-- ex4
SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL

-- ex4 using CASE-WHEN
SELECT
  CASE
    WHEN referee_id != 2 OR referee_id IS NULL THEN name
    ELSE NULL
  END AS name
FROM Customer
WHERE
  CASE
    WHEN referee_id != 2 OR referee_id IS NULL THEN name
    ELSE NULL
  END IS NOT NULL

-- ex5
SELECT survived,
  -- first class
  SUM(CASE WHEN pclass = 1 THEN 1 ELSE 0 END) AS first_class,
  -- second class
  SUM(CASE WHEN pclass = 2 THEN 1 ELSE 0 END) AS second_clas,
  -- third class
  SUM(CASE WHEN pclass = 3 THEN 1 ELSE 0 END) AS third_class
FROM titanic
GROUP BY survived
