var connection = new WebSocket('ws://100.109.23.1:9090');

var msgInput = document.querySelector('#msgInput');
var sendMsgBtn = document.querySelector('#sendMsgBtn');
var messageDisplay = document.querySelector('#messageDisplay');

sendMsgBtn.addEventListener('click', function(event) {
  var val = msgInput.value;
  if (val.length > 0) {
    send({ type: 'message', text: val });
  }
});

connection.onerror = function(err) {
  console.log('Got error', err);
};

connection.onmessage = function(message) {
  console.log('Got message', message.data);
  var data = JSON.parse(message.data);

  if (data.type === 'message') {
    showMessage(data.ip, data.text);
  }
};

function send(message) {
  connection.send(JSON.stringify(message));
}

function showMessage(ip, message) {
  messageDisplay.textContent += ip + ': ' + message + '\n';
}
