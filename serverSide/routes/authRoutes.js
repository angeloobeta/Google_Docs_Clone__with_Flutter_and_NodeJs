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
        if(!user){
            user = new userModel({ name, email, profilePicture});
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
    const user = await userModel.findById(request.user);
    response.json({user, token: request.token})


});


module.exports = authRouter;