const express = require("express");
const app = express();
const PORT = process.env.PORT || 4000;

const server = app.listen(PORT, () => {
  console.log(`Server is running on ${PORT}`);
});

const io = require("socket.io")(server);
var connectedUser = new Set();
io.on("connection", (socket) => {
  var socketID = socket.id;
  connectedUser.add(socketID);
  io.emit("connected-user", connectedUser.size);

  console.log("one user connected ", socketID);

  socket.on("disconnect", (socket) => {
    connectedUser.delete(socketID);
    io.emit("connected-user", connectedUser.size);
    console.log("Client disconnected: ", socketID);
  });

  socket.on("message", (message) => {
    console.log(message);
    socket.broadcast.emit("new-message", message);
  });
});
