const pool = require('../pool');

class UserRepo {

    static async find() {
        const { rows } = await pool.query('SELECT * FROM users');
        return rows;
    }

    static async create() {

    }

    static async findById(id) {
        // my have security issue - SQL Injection
        const { rows } = await pool.query(`
            SELECT * FROM users WHERE id = ${id}
        `);
        return rows;
    }

    static async update() {

    }

    static async delete() {

    }

}

module.exports = UserRepo;
