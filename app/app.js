const http = require("http");
const VERSION = process.env["APP_VERSION"] || "v1";
const PORT = process.env["PORT"] || 3000;
const COLOR = process.env["COLOR"] || "blue";


const server = http.createServer((req, res) => {
  if (req.url === "/health") {
    res.writeHead(200, {"Content-Type": "text/html"});
    res.end(JSON.stringify({status: "healthy", version: VERSION, color: COLOR}));
    return;
  }
  res.writeHead(200, {"Content-Type": "text/html"});
  res.end("<h1>Version: " + VERSION + " | Color: " + COLOR + "</h1>");
});

server.listen(PORT, () => {
  console.log("Running on port " + PORT);
});

