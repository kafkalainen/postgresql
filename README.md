# Testing PostgresQL

## Build and run the containers in detached mode

	docker-compose -d up

## Build and run the containers in foreground

	docker-compose up

## Stop and delete containers

	docker-compose down

## Go inside the container
	docker exec -it <container_name> /bin/bash

## Required packages to install

	sudo apt install postgresql postgresql-contrib

## Login syntax on postgres client

	psql -h 127.0.0.1 -p 8032 -d ${DATABASE_NAME} -U ${USER_NAME}

## Commands

Command | What it does
--------|-------------
`\l` | Show databases
`\c` | Connect to a database vs. USE in SQL
`\dt;` | Show tables in the current database
`\dt+;` | Show extra info about tables in the current database.
`\d <tablename>;` | Describe table
`SELECT first_name \|\| ' ' \|\| last_name FROM actor;` | Concatenates two terms.
`SELECT first_name \|\| ' ' \|\| last_name AS full_name FROM actor;` | Concatenates two terms.
`SELECT first_name \|\| ' ' \|\| last_name AS full_name FROM actor ORDER BY full_name ASC;` | Sorts names to alphabetical order.
`SELECT first_name, LENGTH(first_name) AS len FROM actor ORDER BY len DESC;` | Sort by the length of the first name
`SELECT * FROM actor WHERE first_name LIKE 'AN%';` | Select from actor where first name is starting with An.
`SELECT DISTINCT first_name FROM actor;` | Return distinct values from the table column first_name.
`SELECT DISTINCT first_name, LENGTH(first_name) AS len FROM actor WHERE LENGTH(first_name) > 6 ORDER BY len DESC;` | Return distinct names, and order the result in descending order where name is over 6 characters long.
`SELECT DISTINCT first_name, LENGTH(first_name) AS len FROM actor WHERE LENGTH(first_name) BETWEEN 0 AND 3 ORDER BY len DESC;` | Return distinct names, and order the result in descending order where name is between 0 - 3 characters.
`SELECT * FROM actor WHERE first_name LIKE 'A%' LIMIT 5;` | From actor table select all data where first name starts with A, limit results to 5 rows.
`SELECT * FROM actor WHERE first_name LIKE 'A%' LIMIT 5 OFFSET 3;` | From actor table select all data where first name starts with A, limit results to 5 rows, and offset by three.
`SELECT title, category_id FROM film INNER JOIN film_category ON film_category.film_id = film.film_id;` | Select title and category id from film, which have a film_id on film_category table.
`SELECT title, category_id FROM film LEFT JOIN film_category ON film_category.film_id = film.film_id;` | Select title and category id from film, which have a film_id on film_category table. In case values are not equal, left table will have extra values with null.
`SELECT title, category_id FROM film LEFT JOIN film_category ON film_category.film_id = film.film_id WHERE film_category IS NOT NULL;` | Select title and category id from film, which have a film_id on film_category table. Left table will be the base for this retrieval, discarding the rows that do not have this value.
`SELECT title, category_id FROM film RIGHT JOIN film_category ON film_category.film_id = film.film_id WHERE film_category IS NOT NULL;` | Select title and category id from film, which have a film_id on film_category table. Right table will be the base for this retrieval, discarding the rows that do not have this value.
`SELECT film.title, film.category_id FROM film FULL OUTER JOIN film_category ON film_category.film_id = film.film_id;` | Select title and category id from film, which have a film_id on film_category table. Retrieves all possible values, and adding null rows if some row is not found on other table.
`SELECT film.title, category.name, category.category_id FROM film INNER JOIN film_category ON film_category.film_id = film.film_id INNER JOIN category ON category.category_id = film_category.category_id;` | Do inner join from film to film_category, and inner join that to category table, select film title, category name and id.
`SELECT film.title FROM film FETCH FIRST ROW ONLY;` | Fetch only first row.
`SELECT film.title FROM film OFFSET 3 FETCH NEXT 5 ROWS ONLY;` | Fetch only first 5 rows. FIRST and NEXT are interchangable.
`SELECT * FROM rental WHERE customer_id IN (1,2);` | From rental table select all where customer_id is 1 or 2.
`SELECT customer_id FROM rental WHERE CAST (return_date AS DATE) = '2005-05-27' ORDER BY customer_id;`| Cast value to other type before comparison.
`SELECT payment.customer_id, customer.first_name, customer.last_name, payment.amount FROM payment INNER JOIN customer ON payment.customer_id = customer.customer_id WHERE amount BETWEEN 8 AND 9;` | Fetch all the rows with inner join on customer id, on payment and customer tables, where amount is between 8 and 9 usd.
`SELECT payment.customer_id, customer.first_name, customer.last_name, SUM(payment.amount) AS total FROM payment INNER JOIN customer ON payment.customer_id = customer.customer_id GROUP BY payment.customer_id, customer.first_name, customer.last_name, payment.amount ORDER BY total DESC FETCH NEXT 10 ROWS ONLY;` | Fetch 10 biggest spenders in the customer and payment table.
`SELECT first_name, last_name FROM customer UNION SELECT first_name, last_name FROM actor ORDER BY first_name ASC;` | Returns the names of all customers and actors.
`SELECT first_name, last_name FROM customer INTERSECT SELECT first_name, last_name FROM actor;` | Returns set where first_name and last_name row is the same in both of the tables.
`SELECT first_name, last_name FROM customer EXCEPT SELECT first_name, last_name FROM actor ORDER BY first_name ASC;` | Returns the names of all the customers and actors except the ones that are in both of the tables.
`SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id HAVING SUM(amount) > 200;` | We return customer id:s that have sum of payments over 200 USD. For this we group customers by their ID from payment table, and use conditional HAVING.
`SELECT customer_id, COUNT(amount) FROM payment GROUP BY customer_id HAVING COUNT(amount) > 200;` | We return customer id:s that have sum of payments over 200 USD. For this we group customers by their ID from payment table, and use conditional HAVING.
`SELECT customer_id, COUNT(amount) FROM payment GROUP BY customer_id HAVING COUNT(amount) > 5 ORDER BY COUNT(amount) DESC;` | We return customer id:s that have over 5 transactions in payment table grouped by customer_id in descending order by the count.

## Biggest blocks
- Realizing that docker-compose takes in initalizing sql files alphabetically.

## Learned
- Limit is not part of the SQL standard, FETCH is the recommended way of retrieving certain number of rows.
- PostgreSQL executes the query with the IN operator much faster than the same query that uses a list of OR operators.
- Starting only one service `docker-compose up <service_name>`

# Testing Node.JS and Express

Command | Described
--------|----------
`pool.query(queries.getGamestatesByID, [id], (error, result) =>` | pool is middleware object, which has method query. It accepts SQL statement, and variables to that statement are passed as an array \[id\]. (error, result) is lambdian expression of the callback function, which has error, and result as parameters. When query is made it populates error and result variables, which are used in callback function.

# Links
Node.js Postgres API [Link](https://node-postgres.com/api/pool)
