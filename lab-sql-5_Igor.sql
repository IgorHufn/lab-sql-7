-- Lab | SQL Queries 7

-- In the table actor, which are the actors whose last names are not repeated? 
-- For example if you would sort the data in the table actor by last_name, you would see that there 
-- is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. 
-- So we do not want to include this last name in our output. Last name "Astaire" is present only one time with 
-- actor "Angelina Astaire", hence we would want this in our output list.

SELECT
    last_name
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(last_name) = 1;

-- Which last names appear more than once? We would use the same logic as in the previous question 
-- but this time we want to include the last names of the actors where the last name was present more than once

SELECT
	first_name,
    last_name
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

-- Using the rental table, find out how many rentals were processed by each employee.

SELECT
    staff_id,
    COUNT(staff_id) as rentals
FROM sakila.rental
GROUP BY staff_id
ORDER BY staff_id;

-- Using the film table, find out for each rating how many films were there.

SELECT
    release_year,
    COUNT(*) as films
FROM sakila.film
GROUP BY release_year
ORDER BY films;

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

SELECT 
	rating,
ROUND(avg(length),2) as avg_length
FROM sakila.film
GROUP BY rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?

SELECT 
	rating,
ROUND(avg(length),2) as avg_length
FROM sakila.film
GROUP BY rating
HAVING avg(length) > 120