const pool = require('./src/pool');
const app = require('./src/app');

pool.connect({
    host: 'localhost',
    port: 5432,
    database: 'comprehensive_postgresql_social_network',
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD
})
