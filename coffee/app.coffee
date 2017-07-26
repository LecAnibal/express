express = require('express')
bodyParser = require('body-parser')
path = require('path')
app = express()

jsonInit =
  'displayName': 'futbol'
  'permalink': 'url'
  'isVisited': true
  'links': [
    {
      'displayName': 'nacional'
      'permalink': 'url'
      'isVisited': false
      'links': [
        {
          'displayName': 'Liga MX'
          'permalink': 'url'
          'isVisited': false
          'links': []
        }
        {
          'displayName': 'Ascenso MX'
          'permalink': 'url'
          'isVisited': false
          'links': []
        }
        {
          'displayName': 'Copa MX'
          'permalink': 'url'
          'isVisited': false
          'links': []
        }
        {
          'displayName': 'Selección Mexicana'
          'permalink': 'url'
          'isVisited': false
          'links': []
        }
      ]
    }
    {
      'displayName': 'extranjero'
      'permalink': 'url'
      'isVisited': false
      'links': []
    }
    {
      'displayName': 'internacional'
      'permalink': 'url'
      'isVisited': false
      'links': []
    }
  ]

#app.use bodyParser.raw(type: 'html')
#app.use(bodyParser.json());

app.use(express.static(path.join __dirname + '/../public/'));
app.use(express.static(path.join __dirname + '/../css/'));

#app.get '/', (req, res) ->
# res.sendFile path.join __dirname + '/../public/'+'/index.html'
# return

#app.get '/ ', (req, res) ->
#  res.send 'welcome '
#  return


app.get '/profile/:user', (req, res) ->
  res.send 'welcome ' + req.params.user
  return

app.get '/query', (req, res) ->
  user = req.query.user
  age = req.query.age
  res.send 'User : ' + user + ', Age : ' + age
  return

###$ curl -d '{"MyKey":"My Value"}' -H "Content-Type: application/json" http://127.0.0.1:9293/test-page
app.post('/test-page', function (req, res) {
  console.log(request.body);      // your JSON
   response.send(request.body);    // echo the result back
});
###

app.post '/test-page', (req, res) ->
  body = req.body
  console.log body
  res.send 'status': 'success'
  return
app.get '/test', (req, res) ->
  res.header 'Access-Control-Allow-Origin', '*'
  res.send jsonInit
  return

app.listen 9293, ->
  console.log 'Server listening on port :9293!'
  console.log 'http://localhost:9293/'
  return