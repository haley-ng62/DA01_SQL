-- ex1
SELECT
  COUNTRY.Continent
  , FLOOR(AVG(CITY.Population))
    AS avg_city_population
FROM
  CITY
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
FROM
  emails
  LEFT JOIN texts
    ON emails.email_id = texts.email_id
    AND texts.signup_action = 'Confirmed';

-- ex3
SELECT
  b.age_bucket
  /* time spent sending / total time */
  , ROUND(
    SUM(CASE WHEN a.activity_type = 'send' THEN a.time_spent ELSE 0 END)
      /SUM(a.time_spent) * 100.0
  , 2) AS send_perc,
  ROUND(SUM(CASE WHEN a.activity_type = 'open' THEN a.time_spent ELSE 0 END)
    /SUM(a.time_spent) * 100.0
  , 2) AS open_perc
FROM activities AS a
  INNER JOIN age_breakdown AS b
  ON a.user_id = b.user_id
    AND a.activity_type IN ('send', 'open')
GROUP BY b.age_bucket;
