import cors from "cors";
import dotenv from "dotenv";
import express, { Express, Request, Response } from "express";
import http from "http";
import { Server } from "socket.io";

dotenv.config();

// created express app
const app: Express = express();
app.use(cors());
const port = process.env.PORT || 3000;

// setting up socket.io
const server = http.createServer(app);
var io = new Server(server);

io.on("connection", (socket) => {
  console.log("New user connected");
  //emit message from server to user
  socket.emit("newMessage", {
    from: "jen@mds",
    text: "hepppp",
    createdAt: 123,
  });

  // listen for message from user
  socket.on("newMessage", (newMessage) => {
    console.log("newMessage", newMessage);

    setTimeout(() => {
      socket.emit("messageFromServer", {
        title: "New Message",
        body: "Your attendance is marked success fully for today",
      });
    }, 3000);
  });

  // when server disconnects from user
  socket.on("disconnect", () => {
    console.log("disconnected from user");
  });
});

app.get("/", (req: Request, res: Response) => {
  res.send("Hello World!");
});

server.listen(port, () => {
  console.log(`[server]: Server is running at http://localhost:${port}`);
});
