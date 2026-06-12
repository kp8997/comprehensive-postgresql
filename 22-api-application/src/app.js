const express = require('express');
const userRouter = require('./router/users');

module.exports = () => {
    const app = express();

    app.use(express.json());
    app.use(userRouter);

    return app;
}
