const { Router } = require("express");
const controller = require('./controller');

const router = Router();

// Here router has defined callback functions, which are defined in controller.js
// Express knows to call getGamestate with req, res
router.get("/", controller.getGamestates);
router.get("/:id", controller.getGamestatesById);

module.exports = router;
