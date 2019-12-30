const path = require('path');
const express = require('express');
const app = express();

app.use('/', express.static(path.join(__dirname, '../', 'index.html')));
app.use(express.static('../www'));

app.listen(3000, () => console.log('Serving www on port 3000'));