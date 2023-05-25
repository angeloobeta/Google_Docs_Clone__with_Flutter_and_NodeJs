const mongoose = require("mongoose");

const documentSchema = mongoose.Schema(
    {
        uid: {
            require: true,
            type: String
        },
        createdAt:{
            require: true,
            type: String
        },
        title:{
            trim: true,
            require: true,
            type: String
        },
        content:{
            type: Array,
            default: []
        }
    }
);

const documentModel = mongoose.model("Document",documentSchema);


module.exports = documentModel;