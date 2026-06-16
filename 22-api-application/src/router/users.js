const express = require('express');
const UserRepo = require('../repos/user-repo.js');
const router = express.Router();

router.get('/users', async (req, res) => {
    const users = await UserRepo.find();
    res.send(users);
});

router.get('/users/:id', async (req, res) => {
    const user = await UserRepo.findById(req.params.id);
    res.send(user);
});

router.post('/users', async (req, res) => {
    const { username, bio } = req.body;
    const user = await UserRepo.insert(username, bio);
    res.send(user);
});

router.put('/users/:id', async (req, res) => {
    const { username, bio } = req.body;

    const { id } = req.params;

    if (id) {
        const user = await UserRepo.update(id, username, bio);
        if (user) {
            return res.send(user);
        } else {
            return res.status(404).send('User not found');
        }
    }

    return res.send('id is not provided');
});

router.delete('/users/:id', async (req, res) => {

    const { id } = req.params;

    if (id) {
        const user = await UserRepo.delete(id);

        if (user) {
            return res.send(user);
        } else {
            return res.status(404).send('User not found');
        }
    }

    return res.send('id is not provided');

});

module.exports = router;
