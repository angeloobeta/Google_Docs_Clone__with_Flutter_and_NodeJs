const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
    name: {
        type: String,
        required: true },

    email: {
        type: String,
        required: true },

    profilePicture: {
        type: String,
        required: true,
        trim:true
    }
});


const UserModel = mongoose.model('User', userSchema);
module.exports = UserModel;