const express = require('express');
const pool = require('./db/db.js');

const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
    res.send('Hello World!');
});

app.get('/users', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM test_table');
        res.json(result.rows);
    }  catch (error) {
        console.error('Error fetching users', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});
