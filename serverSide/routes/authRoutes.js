const express = require('express');
const printlog = require("../functions/printLog");
const jwt = require("jsonwebtoken");
const userModel = require("../models/userModel");
const authMiddleWares = require("../middlewares/authMiddleWare");
const {response} = require("express");

const  authRouter = express.Router();


// REST API
authRouter.post("/api/register",async (request, response) => {
    try {
        const {name, email, profilePicture} = request.body;

        // check if user already exist
        let user = await userModel.findOne({email});
        printlog(user)
        printlog(request.ip);
        printlog(request.body);
        if(!user){
            user = new userModel({ name, email, profilePicture});
            user = await user.save();
        }

        const token = jwt.sign({id: user._id}, "googleDocsCloneKey");
        // const token = jwt.sign({id: email}, "googleDocsCloneKey");

        // return the response of the
        response.json({user, token});
        // response.json({token});
    } catch (e) {
        response.status(500).json({error: e.message});
    }
});



authRouter.get("/api/user",authMiddleWares, async (request, response) => {
    const user = await userModel.findById(request.user);
    // const user = await userModel.findById(request.user);
    response.json({user, token: request.token})
    // response.json({token: request.token})


});


module.exports = authRouter;