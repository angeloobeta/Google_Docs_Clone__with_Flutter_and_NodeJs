const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const authRouter = require("./routes/authRoutes");


// const app = express();
const app = express();

//PORT
const  PORT =  process.env.PORT | 3030;
 app.listen(PORT, "localhost", () => {
    console.log(`Connected at Port: ${PORT}`);
});

app.use(cors());
app.use(express.json());
app.use(authRouter);



//DB URL
const DB = "mongodb+srv://mongodb:96951358@cluster0.zmqvuso.mongodb.net/test";

mongoose.connect(DB).then(()=>{
    console.log(`Connection successful`);
    console.log(`E don enter`);
}).catch((e) => {
    console.log(e);
});


