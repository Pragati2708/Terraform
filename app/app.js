const http = require("http");

const server = http.createServer((req, res) => {
  res.end("Hello from ECS 🚀");
});

server.listen(3000, "0.0.0.0", () => {
  console.log("Server is running on port 3000");
});