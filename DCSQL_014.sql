/* DC SQL Introduction - Fourth Block */
/* Part 4 Overview: ORDER BY */
--
--
/* In SQL, the ORDER BY keyword is used to sort results in ascending or
descending order according to the values of one or more columns.
By default ORDER BY will sort in ascending order. If you want to sort the
results in descending order, you can use the DESC keyword. For example:*/
--
SELECT title
FROM films
ORDER BY release_year DESC;
--
--
SELECT name
FROM people
ORDER BY name;
--
--
SELECT name
FROM people
ORDER BY birthdate;
--
--
SELECT birthdate, name
FROM people
ORDER BY birthdate;
--
--
SELECT title
FROM films
WHERE release_year IN ('2000', '2012')
ORDER BY release_year ASC;
--
--
SELECT *
FROM films
WHERE release_year <> 2015
ORDER BY duration;
--
--
SELECT title, gross
FROM films
WHERE title LIKE 'M%'
ORDER BY title;
--
--
SELECT name
FROM people
ORDER BY name DESC;
--
--
SELECT imdb_score, film_id
FROM reviews
ORDER BY imdb_score DESC;
--
--
SELECT title
FROM films
ORDER BY title DESC;
--
--
SELECT title, duration
FROM films
ORDER BY duration DESC;
--
--
SELECT birthdate, name
FROM people
ORDER BY birthdate, name;
--
--
/* Get the birth date and name of people in the people table, in order of
when they were born and alphabetically by name */
SELECT birthdate, name
FROM people
ORDER BY birthdate, name;
--
--
/* Get the release year, duration, and title of films ordered by their
release year and duration. */
SELECT release_year, duration, title
FROM films
ORDER BY release_year, duration
--
--
/* Get certifications, release years, and titles of films ordered by
certification (alphabetically) and release year. */
SELECT certification, release_year, title
FROM films
ORDER BY certification, release_year
--
--
/* Get the names and birthdates of people ordered by name and birth date. */
SELECT name, birthdate
FROM people
ORDER BY name, birthdate;
--
--
--
/* Group by */
--
--
SELECT sex, count(*)
FROM employees
GROUP BY sex;
--
--
SELECT sex, count(*)
FROM employees
GROUP BY sex
ORDER BY count DESC;
--
--
/* Get the release year and count of films released in each year. */
SELECT release_year, COUNT (*)
FROM films
GROUP BY release_year;
--
--
/* Get the release year and average duration of all films, grouped by
release year. */
SELECT release_year, AVG(duration)
FROM films
GROUP BY release_year;
--
--
/* Get the release year and largest budget for all films, grouped by release
year. */
SELECT release_year, MAX(budget)
FROM films
GROUP BY release_year;
--
--
/* Get the IMDB score and count of film reviews grouped by IMDB score in the
reviews table. */
SELECT imdb_score, COUNT(*)
FROM reviews
GROUP BY imdb_score;
--
--
/* Get the title of films released in 2000 or 2012, in the order they were released. */
SELECT title
FROM films
WHERE release_year IN (2000, 2012)
ORDER BY release_year;
--
--
/* Get all details for all films except those released in 2015 and order them by duration. */
SELECT *
FROM films
WHERE release_year <> 2015
ORDER BY duration;
--
--
/* Get the title and gross earnings for movies which begin with the letter 'M'
and order the results alphabetically.*/
SELECT title, gross
FROM films
WHERE title LIKE 'M%'
ORDER BY title;
--
--
/* Get the release year and lowest gross earnings per release year. */
SELECT release_year, MIN(gross)
FROM films
GROUP BY release_year;
--
--
/* Get the language and total gross amount films in each language made.*/
SELECT language, SUM(gross)
FROM films
GROUP BY language;
--
--
SELECT country, SUM(budget)
FROM films
GROUP BY country;
--
--
SELECT release_year, country, MAX(budget)
FROM films
GROUP BY release_year, country
ORDER BY release_year, country;
--
--
SELECT country, release_year, MIN(gross)
FROM films
GROUP BY country, release_year
ORDER BY country, release_year;
--
--
--
/* HAVING */
--
--
--
/* In SQL, aggregate functions can't be used in WHERE clauses. For example, the
following query is invalid: */
--
--
SELECT release_year
FROM films
GROUP BY release_year
WHERE COUNT(title) > 10;
--
--
/* This means that if you want to filter based on the result of an aggregate
function, you need another way! That's where the HAVING clause comes in.
For example*/
--
--
SELECT release_year
FROM films
GROUP BY release_year
HAVING COUNT(title) > 10;
--
--
--
/* All together */
SELECT release_year, budget, gross
FROM films
WHERE release_year > 1990
GROUP BY release_year -- não aceita --
--
SELECT release_year
FROM films
WHERE release_year > 1990
GROUP BY release_year -- aceita --
--
--
/* Modify your query to include the average budget and average gross earnings
for the results you have so far. Alias the average budget as avg_budget;
alias the average gross earnings as avg_gross.*/
SELECT release_year,
AVG(budget) AS avg_budget,
AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
--
--
/* Modify your query so that only years with an average budget of greater than
$60 million are included.*/
SELECT release_year,
AVG(budget) AS avg_budget,
AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 6000000;
--
--
SELECT release_year,
AVG(budget) AS avg_budget,
AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 6000000
ORDER BY avg_gross DESC;
--
--
/* Last Exercises from all together */
/* Get the country, average budget, and average gross take of countries that have
made more than 10 films. Order the result by country name, and limit the number
of results displayed to 5. You should alias the averages as avg_budget and
avg_gross respectively.*/
-- select country, average budget, average gross
SELECT country, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
-- from the films table
FROM films
-- group by country
GROUP BY country
-- where the country has more than 10 titles
HAVING COUNT(title) > 10
-- order by country
ORDER BY country
-- limit to only show 5 results
LIMIT 5;
--
--
