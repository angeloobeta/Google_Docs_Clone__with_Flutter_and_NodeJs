const express = require("express");
const documentModel = require("../models/documentModel");
const documentRouter = express.Router();
const middleWare = require("../middlewares/authMiddleWare");
// const {id} = require("socket.io/lib/client");
const authRouter = require("./authRoutes");



documentRouter.post("/doc/create", authRouter, async (request, response) => {
    try{
        const {createdAt} = request.body;
        let document = new documentModel({
            uid: request.user,
            title: "Untitled Document",
            createdAt
        });

        document = document.save();
        response.json(document);
    }catch(e){
        response.status(500).json({error: e.message});
    }
});

documentRouter.post("/doc/title", authRouter, async (request, response) => {
    try{
        const {id, title} = request.body;
        const document =  await documentModel.findByIdAndUpdate(id,{title})
        response.json(document);
    }catch(e){
        response.status(500).json({error: e.message});
    }
});


documentRouter.get("/doc/:id", authRouter, async(request, response) => {
    try{
        const documents = await documentModel.findById(request.params.id);
        response.json(documents);
    }catch (e){
        response.status(500).json({e: e.message});
    }
})

// GET Document
documentRouter.get("/doc/me", authRouter, (request, response) => {
    try{
        let documents  = await = documentModel.find({uid:request.user});
        response.json(documents);
    }catch(e){
        response.status(500).json({error: e.message});
    }
})


//


module.exports = documentRouter;