require("dotenv").config();
const { Pool } = require("pg");

console.log(process.env.DATABASE_URL);
const pool = new Pool({
	max: 10,
	connectionString: process.env.DATABASE_URL
});

module.exports = pool;
