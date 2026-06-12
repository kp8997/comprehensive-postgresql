const pool = require("./src/pool");
const app = require("./src/app");

pool.connect({
	host: "localhost",
	port: 5432,
	database: "comprehensive_postgresql_social_network",
	user: process.env.DB_USER,
	password: process.env.DB_PASSWORD,
}).then(() => {
	console.log(`connect db successful`);

	app().listen(3005, () => {
		console.log(`Server is running on port 3005`);
	});

}).catch(() => {
	console.log(`connect db failed`);
});

