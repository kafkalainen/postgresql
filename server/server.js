'use strict';

const express = require('express');

const app = express();
const PORT = 8880;
const HOST = '0.0.0.0';

app.get('/', (req, res) => {
  res.send('It\'s a whole new world.');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
