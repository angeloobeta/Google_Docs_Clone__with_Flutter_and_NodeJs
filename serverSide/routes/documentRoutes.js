const express = require("express");
const Document = require("../models/documents");
const documentRouter = express.Router();
const middleWare = require("../middlewares/authMiddleWare");


documentRouter.post("/doc/create", auth, async (request, response) => {
    try{
        const {createdAt} = request.body;
        let document = new Document({
            uid: request.user,
            title: "Untitled Document",
            createdAt
        });

        document = document.save();
        response.json(document);
    }catch(e){
        response.status(500).json({error: e.message});
    };
});


module.exports = documentRouter;