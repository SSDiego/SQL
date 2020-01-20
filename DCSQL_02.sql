/* DC INNER JOIN course */

SELECT *
FROM left_table
INNER JOIN right_table
ON left_table.id = right_table.id;


SELECT *
FROM cities
-- 1. Inner join to countries
INNER JOIN countries
-- 2. Match on the country codes
ON cities.country_code = countries.code;

-- 1. Select name fields (with alias) and region
SELECT cities.name AS city, countries.name AS country, region
FROM cities
INNER JOIN countries
ON cities.country_code = countries.code;

/* Instead of writing the full table name, you can use table aliasing as a
shortcut. For tables you also use AS to add the alias immediately after the
table name with a space. Check out the aliasing of cities and countries below.*/

SELECT c1.name AS city, c2.name AS country
FROM cities AS c1
INNER JOIN countries AS c2
ON c1.country_code = c2.code;

/* Join the tables countries (left) and economies (right)
aliasing countries AS c and economies AS e.
Specify the field to match the tables ON.
From this join, SELECT:
c.code, aliased as country_code.
name, year, and inflation_rate, not aliased.*/

-- 3. Select fields with aliases
SELECT c.code AS country_code, name, year, inflation_rate
FROM countries AS c
-- 1. Join to economies (alias e)
INNER JOIN economies AS e
-- 2. Match on code
ON c.code = e.code;


SELECT *
FROM left_table
INNER JOIN right_table
ON left_table.id = right_table.id
INNER JOIN another_table
ON left_table.id = another_table.id;

/* Inner join countries (left) and populations (right) on the code and
country_code fields respectively. Alias countries AS c and populations AS p.
Select code, name, and region from countries and also select year and
fertility_rate from populations (5 fields in total).*/

-- 4. Select fields
SELECT code, name, region, year, fertility_rate
-- 1. From countries (alias as c)
FROM countries AS c
-- 2. Join with populations (as p)
INNER JOIN populations AS p
-- 3. Match on country code
ON code = country_code

/* Add an additional inner join with economies to your previous query by joining on code.
Include the unemployment_rate column that became available through joining with economies.
Note that year appears in both populations and economies, so you have to explicitly use
e.year instead of year as you did before. */

-- 6. Select fields
SELECT c.code, name, region, e.year, fertility_rate, unemployment_rate
  -- 1. From countries (alias as c)
  FROM countries AS c
  -- 2. Join to populations (as p)
  INNER JOIN populations AS p
    -- 3. Match on country code
    ON c.code = p.country_code
  -- 4. Join to economies (as e)
  INNER JOIN economies AS e
    -- 5. Match on country code
ON c.code = e.code;

/* Scroll down the query result and take a look at the results for Albania
from your previous query. Does something seem off to you?
The trouble with doing your last join on c.code = e.code and not also
including year is that e.g. the 2010 value for fertility_rate is also paired
with the 2015 value for unemployment_rate. Fix your previous query: in your
last ON clause, use AND to add an additional joining condition. In addition to
joining on code in c and e, also join on year in e and p. */

-- 6. Select fields
SELECT c.code, name, region, e.year, fertility_rate, unemployment_rate
  -- 1. From countries (alias as c)
  FROM countries AS c
  -- 2. Join to populations (as p)
  INNER JOIN populations AS p
    -- 3. Match on country code
    ON c.code = p.country_code
  -- 4. Join to economies (as e)
  INNER JOIN economies AS e
    -- 5. Match on country code and year
    ON c.code = e.code AND e.year = p.year;


/*  Inner join with using
    When joining tables with a common field name, e.g. */

    SELECT *
    FROM countries
      INNER JOIN economies
        ON countries.code = economies.code

    /* You can use USING as a shortcut: */

    SELECT *
    FROM countries
      INNER JOIN economies
        USING(code)

/* Inner join countries on the left and languages on the right with USING(code).*/

/*
Select the fields corresponding to:
country name AS country,
continent name,
language name AS language, and
whether or not the language is official.
Remember to alias your tables using the first letter of their names */

-- 4. Select fields
SELECT c.name AS country, continent, l.name AS language, official
  -- 1. From countries (alias as c)
  FROM countries AS c
  -- 2. Join to languages (as l)
  INNER JOIN languages AS l
    -- 3. Match using code
    USING(code);


/* Self-join
In this exercise, you'll use the populations table to perform a self-join to
calculate the percentage increase in population from 2010 to 2015 for each
country code!

Since you'll be joining the populations table to itself,
you can alias populations as p1 and also populations as p2.
This is good practice whenever you are aliasing and your tables have the
same first letter. Note that you are required to alias the tables with
self-joins. */

/* Join populations with itself ON country_code.
Select the country_code from p1 and the size field from both p1 and p2. SQL
won't allow same-named fields, so alias p1.size as size2010 and p2.size as size2015.*/

-- 4. Select fields with aliases
SELECT p1.country_code,
p1.size AS size2010,
p2.size AS size2015
-- 1. From populations (alias as p1)
FROM populations AS p1
  -- 2. Join to itself (alias as p2)
  INNER JOIN populations AS p2
    -- 3. Match on country code
    ON p1.country_code = p2.country_code

/* Notice from the result that for each country_code you have four entries
laying out all combinations of 2010 and 2015.*/

-- 4. Select fields with aliases
SELECT p1.country_code,
p1.size AS size2010,
p2.size AS size2015
-- 1. From populations (alias as p1)
FROM populations AS p1
  -- 2. Join to itself (alias as p2)
  INNER JOIN populations AS p2
    -- 3. Match on country code
    ON p1.country_code = p2.country_code
        -- 4. and year (with calculation)
        AND p1.year = p2.year -5

/* As you just saw, you can also use SQL to calculate values like p2.year - 5
for you. With two fields like size2010 and size2015, you may want to determine
the percentage increase from one field to the next:

With two numeric fields A and B, the percentage growth from A to B can be
calculated as (B−A)/A∗100.0.

Add a new field to SELECT, aliased as growth_perc, that calculates the percentage
population growth from 2010 to 2015 for each country, using p2.size and p1.size.*/

SELECT p1.country_code,
       p1.size AS size2010,
       p2.size AS size2015,
       -- 1. calculate growth_perc
       ((p2.size - p1.size)/p1.size * 100.0) AS growth_perc
-- 2. From populations (alias as p1)
FROM populations AS p1
  -- 3. Join to itself (alias as p2)
  INNER JOIN populations AS p2
    -- 4. Match on country code
    ON p1.country_code = p2.country_code
        -- 5. and year (with calculation)
        AND p1.year = p2.year - 5;

/* Case when and then

Often it's useful to look at a numerical field not as raw data, but instead as
being in different categories or groups.
You can use CASE with WHEN, THEN, ELSE, and END to define a new grouping field.*/

/* Using the countries table, create a new field AS geosize_group that groups
the countries into three groups:
If surface_area is greater than 2 million, geosize_group is 'large'.
If surface_area is greater than 350 thousand but not larger than 2 million,
geosize_group is 'medium'.
Otherwise, geosize_group is 'small'.*/

SELECT name, continent, code, surface_area,
    -- 1. First case
    CASE WHEN surface_area > 2000000 THEN 'large'
        -- 2. Second case
        WHEN surface_area > 350000   THEN 'medium'
        -- 3. Else clause + end
        ELSE 'small' END
        -- 4. Alias name
        AS geosize_group
-- 5. From table
FROM countries;


SELECT name, continent, code, surface_area,
    CASE WHEN surface_area > 2000000
            THEN 'large'
       WHEN surface_area > 350000
            THEN 'medium'
       ELSE 'small' END
       AS geosize_group
INTO countries_plus
FROM countries;

/* Using the populations table focused only for the year 2015, create a new
field aliased as popsize_group to organize population size into
'large' (> 50 million),
'medium' (> 1 million), and
'small' groups.
Select only the country code, population size, and this new popsize_group as fields.*/

SELECT country_code, size,
    -- 1. First case
    CASE WHEN size > 50000000 THEN 'large'
        -- 2. Second case
        WHEN size > 1000000 THEN 'medium'
        -- 3. Else clause + end
        ELSE 'small' END
        -- 4. Alias name (popsize_group)
        AS popsize_group
-- 5. From table
FROM populations
-- 6. Focus on 2015
WHERE year = 2015;

/*Use INTO to save the result of the previous query as pop_plus. You can see an
example of this in the countries_plus code in the assignment text. Make sure to
include a ; at the end of your WHERE clause!

Then, include another query below your first query to display all the records
in pop_plus using SELECT * FROM pop_plus; so that you generate results and this
will display pop_plus in query result.*/

SELECT country_code, size,
    CASE WHEN size > 50000000 THEN 'large'
        WHEN size > 1000000 THEN 'medium'
        ELSE 'small' END
        AS popsize_group
-- 1. Into table
INTO pop_plus
FROM populations
WHERE year = 2015;

-- 2. Select all columns of pop_plus
SELECT *
FROM pop_plus

/* Keep the first query intact that creates pop_plus using INTO.
Write a query to join countries_plus AS c on the left with pop_plus AS p on
the right matching on the country code fields.
Sort the data based on geosize_group, in ascending order so that large appears on top.
Select the name, continent, geosize_group, and popsize_group fields. */

SELECT country_code, size,
  CASE WHEN size > 50000000
            THEN 'large'
       WHEN size > 1000000
            THEN 'medium'
       ELSE 'small' END
       AS popsize_group
INTO pop_plus
FROM populations
WHERE year = 2015;

-- 5. Select fields
SELECT name, continent, geosize_group, popsize_group
-- 1. From countries_plus (alias as c)
FROM countries_plus AS c
  -- 2. Join to pop_plus (alias as p)
  INNER JOIN pop_plus AS p
    -- 3. Match on country code
    ON c.code = p.country_code
-- 4. Order the table
ORDER BY geosize_group;
