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

app.get('/test', function (req, res) {
 res.header('Access-Control-Allow-Origin','*');
  res.send(

      {"displayName":"futbol","permalink":"url","isVisited":true,"links":[{"displayName":"nacional","permalink":"url","isVisited":true,"links":[{"displayName":"Liga MX","permalink":"url","isVisited":false,"links":[]},{"displayName":"Ascenso MX","permalink":"url","isVisited":false,"links":[]},{"displayName":"Copa MX","permalink":"url","isVisited":false,"links":[]},{"displayName":"Selección Mexicana","permalink":"url","isVisited":false,"links":[]}]},{"displayName":"extranjero","permalink":"url","isVisited":false,"links":[]},{"displayName":"internacional","permalink":"url","isVisited":false,"links":[]}]}      );


});

app.listen(9293, function () {
  console.log('express listening on port 9293!');
});
