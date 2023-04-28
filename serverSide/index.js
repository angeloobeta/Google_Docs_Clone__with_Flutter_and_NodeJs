const express = require("express");
const mongoose = require("mongoose");
const auth = require("./routes/auth");

//PORT
const  PORT =  process.env.PORT | 3001;
const app = express(PORT, "0.0.0.0", () => {
    console.log(`Connected at Port: ${PORT}`);
});
app.use(auth);
app.use(express.json());



//DB URL
const DB = "";

mongoose.connect(DB).then(()=>{
    console.log(`Connection successful`);
    console.log(`E don enter`);
}).catch((e) => {
    console.log(e);
});