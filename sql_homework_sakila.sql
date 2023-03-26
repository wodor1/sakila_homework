show databases;

CREATE DATABASE IF NOT EXISTS sakila;

use sakila;

-- első feladat

SELECT last_name, first_name
FROM actor;

-- második feladat
SELECT CONCAT(first_name, ' ', last_name) AS "Actor Name"
FROM actor;
 
SELECT actor_id, last_name, first_name
FROM actor
WHERE first_name LIKE 'Joe';

SELECT *
FROM actor
WHERE last_name LIKE '%gen%';

SELECT last_name, first_name
FROM actor
WHERE last_name LIKE '%li%'
ORDER BY last_name, first_name;

-- harmadik feladat
SELECT COUNT(DISTINCT last_name) AS "különböző vezetéknév"
FROM actor;

-- negyedik feladat
SELECT last_name, COUNT(last_name) AS count
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1
ORDER BY count DESC;

-- ötödik feladat
SELECT country_id, country 
FROM country 
WHERE country = 'China' 
OR country = 'Afghanistan' 
OR country = 'Israel';

-- hatodik feladat
SELECT AVG(length) AS average_length 
FROM film;

-- hetedik feladat
SELECT name, address 
FROM staff_list;

-- nyolcadik feladat
SELECT first_name, last_name, amount 
FROM customer 
JOIN payment ON customer.customer_id = payment.customer_id LIMIT 10;

-- kilencedik feladat
SELECT 
  film.title, 
  GROUP_CONCAT(CONCAT(actor.first_name, ' ', actor.last_name)) AS actors
FROM 
  film
  JOIN film_actor ON film.film_id = film_actor.film_id
  JOIN actor ON film_actor.actor_id = actor.actor_id
GROUP BY 
  film.film_id
LIMIT 20;
