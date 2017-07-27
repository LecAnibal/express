express = require('express')
bodyParser = require('body-parser')
path = require('path')
app = express()

jsonInit = null

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

###
app.get '/profile/:user', (req, res) ->
  res.send 'welcome ' + req.params.user
  return

app.get '/query', (req, res) ->
  user = req.query.user
  age = req.query.age
  res.send 'User : ' + user + ', Age : ' + age
  return

 $ curl -d '{"MyKey":"My Value"}' -H "Content-Type: application/json" http://127.0.0.1:9293/test-page
app.post('/test-page', function (req, res) {
  console.log(request.body);      // your JSON
   response.send(request.body);    // echo the result back
});
###
findItem = (obj, id )  ->
  if obj.id == id
    obj.isVisited = true
    for find of obj.links
      disableItem  obj.links[find]
    return true
  else
    if obj.links.length > 0
      for find of obj.links
        findItem obj.links[find], id
    else
      obj.isVisited = false
      return false



setItemActive = (obj, id) ->
  if findItem obj, id
    console.log 'item encontrado '
  else
    console.log 'item no encontrado'
  return obj;

disableItem = (obj) ->
  obj.isVisited = false
  if obj.links.length > 0
    for oo of obj.links
      obj.links[oo] = disableItem obj.links[oo]
  return obj

app.get '/setActive', (req, res) ->
  id = req.query.id
  jsonInit = setItemActive jsonInit, id
  #res.send jsonInit
  res.redirect '/'
  return


app.get '/test', (req, res) ->
  res.header 'Access-Control-Allow-Origin', '*'
  if jsonInit == null
    jsonInit =
    'displayName': 'Futbol'
    'id': '1'
    'permalink': 'url'
    'isVisited': true
    'links': [
      {
        'displayName': 'Nacional'
        'id': '2'
        'permalink': 'url'
        'isVisited': false
        'links': [
          {
            'displayName': 'LigaMX'
            'id': '5'
            'permalink': 'url'
            'isVisited': false
            'links': [
              {
                'displayName': 'Calendario'
                'id': '9'
                'permalink': 'url'
                'isVisited': false
                'links': []
              }
              {
                'displayName': 'Tabla General'
                'id': '10'
                'permalink': 'url'
                'isVisited': false
                'links': []
              }
              {
                'displayName': 'Cocientes'
                'id': '11'
                'permalink': 'url'
                'isVisited': false
                'links': []
              }
            ]
          }
          {
            'displayName': 'AscensoMX'
            'id': '6'
            'permalink': 'url'
            'isVisited': false
            'links': []
          }
          {
            'displayName': 'CopaMX'
            'id': '7'
            'permalink': 'url'
            'isVisited': true
            'links': []
          }
          {
            'displayName': 'Selección Mexicana'
            'id': '8'
            'permalink': 'url'
            'isVisited': false
            'links': []
          }
        ]
      }
      {
        'displayName': 'Extranjero'
        'id': '3'
        'permalink': 'url'
        'isVisited': false
        'links': []
      }
      {
        'displayName': 'Internacional'
        'id': '4'
        'permalink': 'url'
        'isVisited': false
        'links': []
      }
    ]
    console.log 'es null'

  res.send jsonInit
  return

app.listen 9293, ->
  console.log 'Server listening on port :9293!'
  console.log 'http://localhost:9293/'
  return