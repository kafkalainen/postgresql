const getGamestates = "SELECT * FROM game_states";
const getGamestatesByID = "SELECT * FROM game_states WHERE user_id = $1"

module.exports =
{
	getGamestates,
	getGamestatesByID
}
