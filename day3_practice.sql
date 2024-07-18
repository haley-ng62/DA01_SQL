-- ex1
SELECT NAME
  FROM CITY
  WHERE POPULATION > 120000
  AND COUNTRYCODE = 'USA';

-- ex2
SELECT *
  FROM CITY
  WHERE COUNTRYCODE = 'JPN';

-- ex3
SELECT CITY, STATE
  FROM STATION;

-- ex4
SELECT DISTINCT CITY
  FROM STATION
  WHERE CITY LIKE 'A%'
    OR CITY LIKE 'E%'
    OR CITY LIKE 'I%'
    OR CITY LIKE 'O%'
    OR CITY LIKE 'U%'
  ORDER BY NAME;

-- ex5
SELECT DISTINCT CITY
  FROM STATION
  WHERE CITY LIKE '%A'
    OR CITY LIKE '%E'
    OR CITY LIKE '%I'
    OR CITY LIKE '%O'
    OR CITY LIKE '%U'
  ORDER BY NAME;

-- ex6
SELECT DISTINCT CITY
  FROM STATION
  WHERE NOT (
    CITY LIKE '%A'
      OR CITY LIKE '%E'
      OR CITY LIKE '%I'
      OR CITY LIKE '%O'
      OR CITY LIKE '%U'
    )
  ORDER BY NAME;

-- ex7
SELECT name
  FROM Employee
  ORDER BY name;

-- ex8
SELECT name
  FROM Employee
  WHERE salary > 2000
    AND months < 10
  ORDER BY employee_id;

-- ex9
SELECT product_id
  FROM Products
  WHERE low_fats = 'Y'
    AND recyclable = 'Y';

-- ex10
SELECT name
  FROM Customer
  WHERE referee_id != 2
    OR referee_id IS NULL;

-- ex11
SELECT name, population, area
  FROM World
  WHERE area >= 3000000
    OR population >= 25000000;

-- ex12
SELECT DISTINCT author_id AS id
  FROM Views
  WHERE author_id = viewer_id
  ORDER BY id;

-- ex13
SELECT part, assembly_step
  FROM parts_assembly
  WHERE finish_date IS NULL;

-- ex14
SELECT *
  FROM lyft_drivers
  WHERE NOT yearly_salary BETWEEN 30000 AND 70000;

-- ex15
SELECT *
  FROM uber_advertising
  WHERE money_spent > 100000;






