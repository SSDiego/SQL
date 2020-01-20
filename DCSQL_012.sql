/* DC SQL Introduction - Second Block */
/* Part 2 Overview: Filtering results */
--
/* In SQL, the WHERE keyword allows you to filter based on both text and numeric
   values in a table. There are a few different comparison operators you can use:
--
= equal
<> not equal
< less than
> greater than
<= less than or equal to
>= greater than or equal to */
--
/* Exemples */
--
SELECT title
FROM films
WHERE title = 'Metropolis';
--
--
SELECT title
FROM films
WHERE release_year > 2000;
--
--
SELECT *
FROM films
WHERE budget > 10000;
--
--
/* Get all details for all films released in 2016.*/
SELECT *
FROM films
WHERE release_year = 2016;
--
--
/* Get the number of films released before 2000. */
SELECT COUNT(*)
FROM films
WHERE release_year < 2000;
--
--
/* Get the title and release year of films released after 2000. */
SELECT title, release_year
FROM films
WHERE release_year > 2000;
--
--
SELECT title
FROM films
WHERE country = 'China';
--
--
/* Get all details for all French language films. */
SELECT *
FROM films
WHERE  language = 'French';
--
--
/* Get the name and birth date of the person born on November 11th, 1974.
   Remember to use ISO date format ('1974-11-11')! */
SELECT name, birthdate
FROM people
WHERE birthdate = '1974-11-11';
--
--
/* Get the number of Hindi language films. */
SELECT COUNT(language)
FROM films
WHERE language = 'Hindi';
--
--
/* Get all details for all films with an R certification. */
SELECT *
FROM films
WHERE certification = 'R';
--
--
/* Multiple Condition */
SELECT title
FROM films
WHERE release_year > 1994
AND release_year < 2000;
--
--
SELECT title
FROM films
WHERE release_year > 1994 AND < 2000;
--
--
/* Get the title and release year for all Spanish language films released
   before 2000. */
SELECT title, release_year
FROM films
WHERE language = 'Spanish' AND release_year < '2000';
--
--
/* Get all details for Spanish language films released after 2000. */
SELECT *
FROM films
WHERE language = 'Spanish' AND release_year > '2000';
--
--
/* Get all details for Spanish language films released after 2000,
   but before 2010. */
SELECT *
FROM films
WHERE release_year > '2000'
AND release_year < '2010'
AND language = 'Spanish';
--
--
--
/* WHERE AND OR
You want to select rows based on multiple conditions where some but not all of
the conditions need to be met */
--
--
SELECT title
FROM films
WHERE release_year = 1994
OR release_year = 2000;
--
/* Note that you need to specify the column for every OR condition */
--
--
SELECT title
FROM films
WHERE (release_year = 1994 OR release_year = 1995)
AND (certification = 'PG' OR certification = 'R');
--
--
/* Get the title and release year for films released in the 90s. */
SELECT title, release_year
FROM films
WHERE release_year >= '1990'
AND release_year < '2000';
--
--
/* Now, build on your query to filter the records to only include French or
Spanish language films. */
SELECT title, release_year
FROM films
WHERE (release_year >= '1990'
AND release_year < '2000')
AND (language = 'French' OR language = 'Spanish');
/* Finally, restrict the query to only return films that took in more than
$2M gross */
SELECT title, release_year
FROM films
WHERE (release_year >= '1990'
AND release_year < '2000')
AND (language = 'French' OR language = 'Spanish')
AND (gross >= '2000000');
--
--
/* Between */
--
--
SELECT title
FROM films
WHERE release_year
BETWEEN 1994 AND 2000;
--
--
SELECT name
FROM kids
WHERE age BETWEEN 2 AND 12
AND nationality = 'USA';
--
--
/* Get the title and release year of all films released between 1990 and
2000 (inclusive). */
SELECT title, release_year
FROM films
WHERE release_year
BETWEEN 1990 AND 2000;
--
--
/* Now, build on your previous query to select only films that have budgets
over $100 million.*/
SELECT title, release_year
FROM films
WHERE (release_year
BETWEEN 1990 AND 2000)
AND budget > '100000000';
--
--
/*Now restrict the query to only return Spanish language films. */
SELECT title, release_year
FROM films
WHERE (release_year
BETWEEN 1990 AND 2000)
AND budget > '100000000'
AND language = 'Spanish';
--
--
/* Finally, modify to your previous query to include all Spanish language or
French language films with the same criteria as before. Don't forget your
parentheses! */
SELECT title, release_year
FROM films
WHERE (release_year
BETWEEN 1990 AND 2000)
AND budget > '100000000'
AND (language = 'Spanish' or language = 'French');
--
--
--
/* WHERE IN */
--
--
SELECT name
FROM kids
WHERE age = 2
OR age = 4
OR age = 6
OR age = 8
OR age = 10;
--
--
SELECT name
FROM kids
WHERE age IN (2, 4, 6, 8, 10);
--
--
/* Get the title and release year of all films released in 1990 or 2000 that
were longer than two hours. Remember, duration is in minutes! */
SELECT title, release_year
FROM films
WHERE release_year IN ('1990', '2000')
AND duration > 120;
--
--
/* Get the title and language of all films which were in English, Spanish,
or French. */
SELECT title, language
FROM films
WHERE language IN ('English', 'Spanish', 'French');
--
--
/* Get the title and certification of all films with an NC-17 or R certification.*/
SELECT title, certification
FROM films
WHERE certification IN ('NC-17', 'R');
--
--
--
/* Introduction to NULL and IS NULL
In SQL, NULL represents a missing or unknown value. You can check for NULL values
using the expression IS NULL. For example, to count the number of missing birth
dates in the people table: */
--
SELECT COUNT(*)
FROM people
WHERE birthdate IS NULL;
--
/* As you can see, IS NULL is useful when combined with WHERE
to figure out what data you're missing.*/
--
/* Sometimes, you'll want to filter out missing values so you only get results
which are not NULL. To do this, you can use the IS NOT NULL operator.
For example, this query gives the names of all people whose birth dates are not
missing in the people table. */
--
--
SELECT name
FROM people
WHERE birthdate IS NOT NULL;
--
--
/* Get the names of people who are still alive, i.e. whose death date is missing. */
SELECT name
FROM people
WHERE deathdate IS NULL;
--
--
/* Get the title of every film which doesn't have a budget associated with it. */
SELECT title
FROM films
WHERE budget IS NULL;
--
--
/* Get the number of films which don't have a language associated with them. */
SELECT COUNT(*)
FROM films
WHERE language IS NULL;
--
--
--
/* Like and Not Like */
/* In SQL, the LIKE operator can be used in a WHERE clause to search for a
pattern in a column. To accomplish this, you use something called a wildcard
as a placeholder for some other values. There are two wildcards you can use with LIKE:
--
The % wildcard will match zero, one, or many characters in text. For example,
the following query matches companies like 'Data', 'DataC' 'DataCamp', 'DataMind',
and so on: */
--
SELECT name
FROM companies
WHERE name LIKE 'Data%';
--
SELECT name
FROM companies
WHERE name LIKE 'DataC_mp';
--
--
/* Get the names of all people whose names begin with 'B'. The pattern you need is 'B%'.*/
SELECT name
FROM people
WHERE name LIKE 'B%';
--
--
/* Get the names of people whose names have 'r' as the second letter. The pattern you need is '_r%'. */
SELECT name
FROM people
WHERE name LIKE '_r%';
--
--
/* Get the names of people whose names don't start with A. The pattern you need is 'A%'.*/
SELECT name
FROM people
WHERE name NOT LIKE 'A%'
