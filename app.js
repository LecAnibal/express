var express = require('express');
var bodyParser = require('body-parser')

var app = express();

app.use(bodyParser.raw({ type: 'application/*+xml' }));
 //app.use(bodyParser.json());

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

/*$ curl -d '{"MyKey":"My Value"}' -H "Content-Type: application/json" http://127.0.0.1:9293/test-page
app.post('/test-page', function (req, res) {
  console.log(request.body);      // your JSON
   response.send(request.body);    // echo the result back
});
*/
app.post('/test-page', function (req, res) {
  var body = req.body;
  console.log(body);
  res.send( {"status":"success"});
});


app.listen(9293, function () {
  console.log('express listening on port 9293!');
});
