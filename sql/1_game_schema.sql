-- Connect to the database
\c livelyactionguru_2212372;

-- Create player_accounts as first table.
CREATE TABLE player_accounts
(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
);

-- Create game_states table to hold game data, and use player_accounts user_id as a foreign key
CREATE TABLE game_states
(
	id SERIAL,
	user_id SERIAL,
	salt_amount BIGINT,
	cattle_amount BIGINT,
	grain_amount BIGINT,
	fur_amount BIGINT,
	created_on TIMESTAMP NOT NULL,
	updated TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (user_id)
		REFERENCES player_accounts (user_id)
);
