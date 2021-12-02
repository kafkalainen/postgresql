\c livelyactionguru_2212372;
INSERT INTO player_accounts
(
	username,
	password,
	email,
	created_on
)
VALUES
(
	'lumberjack873',
	'awdjasjkaskd',
	'lumberjack@canada.com',
	CURRENT_TIMESTAMP
),
(
	'maxorhaxor666',
	'aklsdlkadlkw',
	'maxhass@berlin.de',
	CURRENT_TIMESTAMP
);

INSERT INTO game_states
(
	user_id,
	salt_amount,
	cattle_amount,
	grain_amount,
	fur_amount,
	created_on
)
VALUES
(
	1,
	50,
	2,
	500,
	200,
	CURRENT_TIMESTAMP
),
(
	2,
	10000,
	20000,
	50000000,
	20000,
	CURRENT_TIMESTAMP
);
