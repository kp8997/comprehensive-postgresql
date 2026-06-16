const pool = require('../pool');

class UserRepo {

    static async find() {
        const { rows } = await pool.query('SELECT * FROM users');
        return rows;
    }

    static async findById(id) {
        // might have security issue - SQL Injection
        // const { rows } = await pool.query(`
        //     SELECT * FROM users WHERE id = ${id}
        // `);

        const { rows } = await pool.query(`
            SELECT * FROM users WHERE id = $1;
        `, [id]);

        return rows;
    }

    static async insert(username, bio) {
        const { rows } = await pool.query(`INSERT into users(username, bio) values ($1, $2) returning *`, [username, bio]);
        return rows;
    }

    static async update(id, username, bio) {
        const { rows } = await pool.query(`UPDATE users SET username = $2, bio = $3 WHERE id = $1 returning *`, [id, username, bio]);
        return rows;
    }

    static async delete(id) {
        const { rows } = await pool.query(`DELETE FROM users WHERE id = $1 returning *`, [id]);
        return rows;
    }

}

module.exports = UserRepo;
