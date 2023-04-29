const WebSocket = require('ws');
const express = require('express');
const path = require('path');
const app = express();
const server = require('http').createServer(app);
const wss = new WebSocket.Server({ server });

app.use(express.static(path.join(__dirname)));

wss.on('connection', (ws) => {
  console.log('Client connected');
  ws.on('message', (message) => {
    let data;

    try {
      data = JSON.parse(message);
    } catch (error) {
      console.error('Invalid JSON', error);
      data = {};
    }

    const { type, text } = data;

    switch (type) {
      case 'message':
        console.log('Message received:', text);
        handleMessage(ws, text);
        break;
      default:
        console.error('Unsupported message type:', type);
        break;
    }
  });

  ws.on('close', () => {
    console.log('Client disconnected');
  });
});

function handleMessage(sender, message) {
  wss.clients.forEach((client) => {
    if (client !== sender && client.readyState === WebSocket.OPEN) {
      client.send(
        JSON.stringify({
          type: 'message',
          ip: sender._socket.remoteAddress,
          text: message,
        })
      );
    }
  });
}

server.listen(9090, () => {
  console.log('Listening on 9090');
});
