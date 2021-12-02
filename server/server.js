'use strict';

const express = require('express');
const gameStateRoutes = require('./gamestate/routes');

const app = express();
const PORT = 8880;
const HOST = '0.0.0.0';

app.use(express.json());

app.get('/', (req, res) => {
  res.send('It\'s a whole new world.');
});

app.use('/api/v1/gamestate', gameStateRoutes);

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
