const pool = require("../db");
const queries = require("./queries");

const getGamestates = (req, res) => {
	pool.query(queries.getGamestates, (error, result) => {
		if (error) throw error;
		res.status(200).json(result.rows);
	})
};

const getGamestatesById = (req, res) => {
	const id = parseInt(req.params.id);
	pool.query(queries.getGamestatesByID, [id], (error, result) => {
		if (error) throw error;
		res.status(200).json(result.rows);
	})
};

module.exports = {
	getGamestates,
	getGamestatesById
}
