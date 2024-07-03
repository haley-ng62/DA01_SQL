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
