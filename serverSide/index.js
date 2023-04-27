// npm i express http socket.io@2.3.0 jsonwebtoken mongoose
console.log("");
// npm i nodemon --save-dev
const express = require("express");
const mongoose = require("mongoose");

app.use.(express.json());
app.use(authRouter);
const auth = require("./routes/auth")

//DB URL
 const DB = "";

 mongoose.connect(DB).then(()=>{
     console.log(`Connection successful`);
     console.log(`E don enter`);
 }).catch((e) => {
     console.log(e);
 });


//PORT
const  PORT =  process.env.PORT | 3001;

const app = express(PORT, "0.0.0.0", () => {
    console.log(`Connected at Port: ${PORT}`);
});