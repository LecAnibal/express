var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.send('express online!!!');
});

app.get('/profile/:user', function (req, res) {
  res.send('welcome '+req.params.user);
});

app.get('/query', function (req, res) {

  var user = req.query.user;
  var age = req.query.age;
  res.send("User : "+user+ ", Age : "+age);
});

app.listen(8080, function () {
  console.log('express listening on port 8080!');
});
