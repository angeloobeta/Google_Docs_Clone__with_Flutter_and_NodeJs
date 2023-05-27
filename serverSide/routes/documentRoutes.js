const express = require("express");
const documentModel = require("../models/documentModel");
const documentRouter = express.Router();
const middleWare = require("../middlewares/authMiddleWare");
// const {id} = require("socket.io/lib/client");
const authRouter = require("./authRoutes");
const {request} = require("http");
const authMiddleWares = require("../middlewares/authMiddleWare");
const printLog = require("../functions/printLog");


documentRouter.post("/api/docs/create", authMiddleWares, async (request, response) => {
    try{
        const {createdAt} = request.body;
        let document = new documentModel({
            uid: request.user,
            title: "Untitled Document",
            createdAt
        });

        document = await document.save();
        response.json({document});
    }catch(e){
        response.status(500).json({error: e.message});
    }
});

documentRouter.post("/api/docs/title", authMiddleWares, async (request, response) => {
    try{
        const {id, title} = request.body;
        const document =  await documentModel.findByIdAndUpdate(id,{title})
        response.json({document});
    }catch(e){
        response.status(500).json({error: e.message});
    }
});


documentRouter.get("/api/docs/:id", authMiddleWares, async(request, response) => {
    try{
        const documents = await documentModel.findById(request.params.id);
        response.json({documents});
    }catch (e){
        response.status(500).json({e: e.message});
    }
});


// GET Document
documentRouter.get("/api/docs/me", authMiddleWares, async (request, response) => {
    printLog("Will the fetch all me document go through");
    try{
        let documents  = await  documentModel.find({uid: request.user});
        printLog("This is the collection of documents: " + documents);
        response.json({documents});
    }catch(e){
        printLog("This is the collection of documents: " + documents);
        response.status(500).json({error: e.message});
    }
});


//GET All Document
documentRouter.get("/api/docs", authMiddleWares, async (request, response) => {
    // try{
    //     // let documents  = await documentModel.
    // }
});

//


module.exports = documentRouter;