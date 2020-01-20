/* DC SQL Introduction - First Block */
/* Part 1 Overview: Select, Select Distinct, Select Count */
--
--
--
Select 'DC <3 SQL'
AS result;
--
--
SELECT 'SQL'
AS result;
--
--
/* The quoting '' and the use of AS function as a the 'print' for python or a 'call'
for R */
--
--
SELECT name, birthdate
FROM people;
--
--
SELECT *
FROM people;
--
--
SELECT *
FROM people
LIMIT 10;
--
--
/* Three ways to select from. The first one is for multiple collumms, the second
one is for select all, and the last one to limit the number of rows */
--
--
SELECT DISTINCT language
FROM films;
--
--
/* This is a interesting one, it select only one of eatch and show you */
--
--
SELECT COUNT(*)
FROM reviews;
--
--
SELECT COUNT(birthdate)
FROM people;
--
--
SELECT COUNT(DISTINCT birthdate)
FROM people;
--
--
/* It is a simple counter within some variaty */
--
--
/* Exercise */
--
--
/* Count the number of rows in the people table */
SELECT COUNT(id)
FROM people;
--
/* Count the number of (non-missing) birth dates in the people table */
SELECT COUNT(birthdate)
FROM people;
--
/* Count the number of unique birth dates in the people table */
SELECT COUNT(DISTINCT birthdate)
FROM people;
--
/* Count the number of unique languages in the films table */
SELECT COUNT(DISTINCT language)
FROM films;
