const { Pool } = require('pg');

const pool = new Pool({
    user: 'chdrchz',
    host: 'localhost',
    database: 'test_db',
    password: 'password',
    port: 5432
});

module.exports = pool;