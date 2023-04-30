const express = require('express');
const jwt = require("jsonwebtoken");
const User = require("../models/user");
const authMiddleWares = require("../middlewares/authMiddleWare");
const {response} = require("express");

const  authRouter = express.Router();

authRouter.get("/hello", async (request, response)=>{
    response.json({"reply": "We are good"});
})

// REST API
authRouter.post("/api/register",async (request, response) => {
    try {
        const {name, email, profilePicture} = request.body;
        let user = await User.findOne({email});
        if(!user){
            user = new User({ name, email, profilePicture});
            user = await user.save();
        }

        const token = jwt.sign({id: user._id}, "googleDocsCloneKey");

        // return the response of the
        response.json({user, token});
    } catch (e) {
        response.status(500).json({error: e.message});
    }
});

authRouter.get("/",authMiddleWares, async (request, response) => {
    const user = await User.findById(request.user);
    response.json({user, token: request.token})


});


module.exports = authRouter;