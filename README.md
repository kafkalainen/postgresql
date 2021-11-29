# Testing PostgresQL

## Build and run the containers in detached mode

	docker-compose -d up

## Build and run the containers in foreground

	docker-compose up

## Stop and delete containers

	docker-compose down

## Login command
psql -h 127.0.0.1 -p 5432 -d ${DATABASE_NAME} -U ${USER_NAME}

## Commands

Command | What it does
--------|-------------
`\dt` | Show tables in the current database
`\dt+` | Show extra info about tables in the current database.
`\d <tablename>` | Describe table
`SELECT first_name \|\| ' ' \|\| last_name FROM actor;` | Concatenates two terms.
`SELECT first_name \|\| ' ' \|\| last_name AS full_name FROM actor;` | Concatenates two terms.
`SELECT first_name \|\| ' ' \|\| last_name AS full_name FROM actor ORDER BY full_name ASC;` | Sorts names to alphabetical order.
`SELECT first_name, LENGTH(first_name) AS len FROM actor ORDER BY len DESC;` | Sort by the length of the first name
`SELECT DISTINCT first_name FROM actor` | Return distinct values from the table column first_name.
`SELECT DISTINCT first_name, LENGTH(first_name) AS len FROM actor WHERE LENGTH(first_name) > 6 ORDER BY len DESC;` | Return distinct names, and order the result in descending order where name is over 6 characters long.
`SELECT DISTINCT first_name, LENGTH(first_name) AS len FROM actor WHERE LENGTH(first_name) BETWEEN 0 AND 3 ORDER BY len DESC` | Return distinct names, and order the result in descending order where name is between 0 - 3 characters.

## Biggest blocks
- Realizing that docker-compose takes in initalizing sql files alphabetically.
