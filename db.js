require('dotenv').config();  // add this line

const { Pool } = require('pg');

const pool = new Pool(); // uses environment variables automatically
console.log('Connecting to DB with:', process.env.PGUSER, process.env.PGDATABASE);

module.exports = pool;
