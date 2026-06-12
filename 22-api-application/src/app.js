const express = require('express');
const userRouter = require('./router/users');

module.exports = () => {
    const app = express();

    // cors just in case
    // app.use((req, res, next) => {
    //     res.header("Access-Control-Allow-Origin", "*");
    //     res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Authorization");
    //     res.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
    //     if (req.method === 'OPTIONS') {
    //         return res.sendStatus(200);
    //     }
    //     next();
    // });

    app.use(express.json());
    app.use(userRouter);

    return app;
}
