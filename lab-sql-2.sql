# Select all the actors with the first name ‘Scarlett’.
SELECT *
FROM sakila.actor
WHERE first_name = 'Scarlett';


# Select all the actors with the last name ‘Johansson’.
SELECT *
FROM sakila.actor
WHERE last_name = 'Johansson';


# How many films (movies) are available for rent?
SELECT COUNT(inventory_id)
FROM sakila.inventory;


# How many films have been rented?
SELECT COUNT(DISTINCT inventory_id)
FROM sakila.rental;

# What is the shortest and longest rental period?
SELECT *
FROM sakila.rental;


SELECT MAX(DATEDIFF(CONVERT(return_date,date),CONVERT(rental_date,date))) as longest_rental_period , MIN(DATEDIFF(CONVERT(return_date,date),CONVERT(rental_date,date))) as shortest_rental_period
FROM sakila.rental;

# What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) as max_duration, MIN(length) as min_duration
FROM sakila.film;


# What's the average movie duration?
SELECT ROUND(AVG(length),2) as average
FROM sakila.film;


# What's the average movie duration expressed in format (hours, minutes)?
SELECT CONVERT(ROUND(AVG(length),2), TIME) as average
FROM sakila.film;


# How many movies longer than 3 hours?
SELECT COUNT(length) as longer_than_3_hours
FROM sakila.film
WHERE length > 180;


# Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
SELECT CONCAT(CONCAT(UPPER(LEFT(first_name,1)),SUBSTRING(lower(first_name), 2)), ' ', upper(last_name)) as actor_name, CONCAT(lower(first_name), '.', lower(last_name), '@sakila.customer.org') as actor_email
FROM sakila.actor;


# What's the length of the longest film title?
SELECT title, LENGTH(title) as longest_film_title
FROM sakila.film
ORDER BY LENGTH(title) DESC
LIMIT 1;

#other option
SELECT title as longest_film_title
FROM sakila.film
WHERE LENGTH(title) = (SELECT MAX(LENGTH(title)) FROM sakila.film);