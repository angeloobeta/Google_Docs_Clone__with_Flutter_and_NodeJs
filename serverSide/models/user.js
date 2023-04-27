const mongoose = require("mongooes");

const userSchema = mongooes.Schema({
    name: {
        type: String,
        required: true },

    email: {
        type: String,
        required: true },

    profilePicture: {
        type: String,
        required: true }
});


const User = mongoose.model('User', userSchema);
module.exports = User;