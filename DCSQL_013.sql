/* DC SQL Introduction - Third Block */
/* Part 3 Overview: Aggregate Functions */
--
/* Often, you will want to perform some calculation on the data in a database.
SQL provides a few functions, called aggregate functions, to help you out with this.
For example,*/
--
SELECT AVG(budget)
FROM films;
--
SELECT MAX(budget)
FROM films;
--
SELECT SUM(budget)
FROM films;
--
SELECT MIN(duration)
FROM films;
--
SELECT SUM(budget)
FROM films
WHERE release_year >= 2010;
--
SELECT AVG(gross)
FROM films
WHERE title LIKE 'A%';
--
SELECT MAX(gross)
FROM films
WHERE release_year BETWEEN '2000' AND '2012'
--
--
--
/* Arithmetics */
SELECT (4 * 3);
--
SELECT (4 / 3);
--
SELECT (4.0 / 3.0) AS result;
--
SELECT (10 / 3) AS result;
--
--
--
/*
It's AS simple AS aliasing
You may have noticed in the first exercise of this chapter that the column name
of your result was just the name of the function you used. For example, */
--
SELECT MAX(budget)
FROM films;
gives you a result with one column, named max. But what if you use two functions like this?
--
SELECT MAX(budget), MAX(duration)
FROM films;
--
/* Well, then you'd have two columns named max, which isn't very useful!
To avoid situations like this, SQL allows you to do something called aliasing.
Aliasing simply means you assign a temporary name to something. To alias,
you use the AS keyword, which you've already seen earlier in this course.
For example, in the above example we could use aliases to make the result
clearer:*/
--
SELECT MAX(budget) AS max_budget,
       MAX(duration) AS max_duration
FROM films;
--
/*Aliases are helpful for making results more readable!*/
/* Get the title and net profit (the amount a film grossed,
minus its budget) for all films. Alias the net profit as net_profit*/
SELECT title, gross - budget AS net_profit
FROM films;
--
--
/* Get the title and duration in hours for all films. The duration is in
minutes, so you'll need to divide by 60.0 to get the duration in hours.
Alias the duration in hours as duration_hours.*/
SELECT title, durantion / 60.0 AS durantion_hours
FROM films;
--
--
/*Get the average duration in hours for all films, aliased as avg_duration_hours.*/
SELECT AVG(duration) / 60.0 AS avg_duration_hours
FROM films;
--
--
/* Get the percentage of people who are no longer alive. Alias the result as
percentage_dead. Remember to use 100.0 and not 100!*/
SELECT COUNT(deathdate) * 100.0 / COUNT (*) AS percentage_dead
FROM people;
--
--
/* Get the number of years between the newest film and oldest film. Alias the
result as difference.*/
SELECT  MAX(release_year) - MIN(release_year) AS difference
FROM films;
--
--
/* Get the number of decades the films table covers. Alias the result as
number_of_decades. The top half of your fraction should be enclosed in
parentheses.*/
SELECT (MAX(release_year) - MIN(release_year)) / 10.0
AS number_of_decades
FROM films;
