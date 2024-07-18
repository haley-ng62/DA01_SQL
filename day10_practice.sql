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
