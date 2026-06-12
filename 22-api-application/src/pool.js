const pg = require('pg');

class Pool {
    _pool = null;

    connect(options) {
        this._pool = new pg.Pool(options);
        return this._pool.query('SELECT 1 + 1'); // to test to actually connect to db by query
    }
}

module.exports = new Pool();
