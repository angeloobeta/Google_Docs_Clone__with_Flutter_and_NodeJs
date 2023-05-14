const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const http = require("http");
const authRouter = require("./routes/authRoutes");
const documentRouter = require("./routes/documentRoutes");

// const app = express();
const app = express();
var server = http.createServer(app);
var io = require("socket.io")(server);

//PORT
const  PORT =  process.env.PORT | 3030;
//DB URL
const DB = "mongodb+srv://mongodb:96951358@cluster0.zmqvuso.mongodb.net/test";


app.use(cors());
app.use(express.json());
app.use(authRouter);
app.use(documentRouter);




mongoose.connect(DB).then(()=>{
    printLog(`MongoDB connection de successful`);
}).catch((e) => {
    printLog(e);
});


// console.log(`This is before the socket-connection`);
io.on("connection", (socket) =>{
  printLog('A client has connected ');
    printLog("Socket connected at Port:" + socket.id);
  socket.on('disconnect', () => {
    printLog('A client has disconnected');
  });
    socket.on('join', (documentId) =>{
        socket.join(documentId);
    });

    socket.on("typing", (data) =>{
        socket.broadcast.to(data.room).emit('changes', data);
    });
});

server.listen(PORT, () => {
  printLog("Server is up and de running on port " + PORT);
});


function printLog(message) {console.log(`${message}`);}