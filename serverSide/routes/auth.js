const express = require('express');
const User = require('../models/user');

const  authRouter = express.Router();

// REST API
authRouter.post("api/signup",async (request, response) => {
    try {
        const {name, email, profilePicture} = request.body;
        let user = await User.findOne({email});
        if(!user){
            user = new User({ name, email, profilePicture});
            user = await user.save();
        }
        // return the response of the
        response.json({user});
    } catch (e) {}
});

authRouter.get("api/sign",(request, response) => {

});


module.exports = authRouter;