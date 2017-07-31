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
            'id': '3'
            'permalink': 'url'
            'isVisited': false
            'links': [
              {
                'displayName': 'Noticias'
                'id': '4'
                'permalink': 'url'
                'isVisited': false
                'links': []
              }
              {
                'displayName': 'Tabla General'
                'id': '5'
                'permalink': 'url'
                'isVisited': false
                'links': [
                  {
                    'displayName': 'Torneo'
                    'id': '6'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                  {
                    'displayName': 'Jornada'
                    'id': '7'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                  {
                    'displayName': 'Local/Visitante'
                    'id': '8'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                ]
              }
              {
                'displayName': 'Calendario'
                'id': '9'
                'permalink': 'url'
                'isVisited': false
                'links': [
                  {
                    'displayName': 'Torneo'
                    'id': '10'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                  {
                    'displayName': 'Jornada'
                    'id': '11'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                ]
              }
              {
                'displayName': 'Estadísticas'
                'id': '12'
                'permalink': 'url'
                'isVisited': false
                'links': [
                  {
                    'displayName': 'Por equipo'
                    'id': '13'
                    'permalink': 'url'
                    'isVisited': false
                    'links': [
                      {
                        'displayName': 'Torneo'
                        'id': '14'
                        'permalink': 'url'
                        'isVisited': false
                        'links': []
                      }
                      {
                        'displayName': 'Local/Visitante'
                        'id': '15'
                        'permalink': 'url'
                        'isVisited': false
                        'links': [
                          {
                            'displayName': 'Ver más'
                            'id': '16'
                            'permalink': 'url'
                            'isVisited': false
                            'links': [
                              {
                                'displayName': 'Torneo'
                                'id': '17'
                                'permalink': 'url'
                                'isVisited': false
                                'links': []
                              }
                              {
                                'displayName': 'Local/Visitante'
                                'id': '18'
                                'permalink': 'url'
                                'isVisited': false
                                'links': []
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  }
                  {
                    'displayName': 'Por jugador'
                    'id': '19'
                    'permalink': 'url'
                    'isVisited': false
                    'links': [
                      {
                        'displayName': 'Torneo'
                        'id': '20'
                        'permalink': 'url'
                        'isVisited': false
                        'links': []
                      }
                      {
                        'displayName': 'Local/Visitante'
                        'id': '21'
                        'permalink': 'url'
                        'isVisited': false
                        'links': []
                      }
                    ]
                  }
                ]
              }
              {
                'displayName': 'Cocientes'
                'id': '22'
                'permalink': 'url'
                'isVisited': false
                'links': [
                  {
                    'displayName': 'Torneo'
                    'id': '23'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                ]
              }
              {
                'displayName': 'Jugadores'
                'id': '24'
                'permalink': 'url'
                'isVisited': false
                'links': [
                  {
                    'displayName': 'Torneo'
                    'id': '25'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                  {
                    'displayName': 'Equipos'
                    'id': '26'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                  {
                    'displayName': 'Por nombre'
                    'id': '27'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                ]
              }
              {
                'displayName': 'Equipos'
                'id': '28'
                'permalink': 'url'
                'isVisited': false
                'links': [
                  {
                    'displayName': 'Torneo'
                    'id': '29'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                ]
              }
              {
                'displayName': 'Info'
                'id': '30'
                'permalink': 'url'
                'isVisited': false
                'links': []
              }
              {
                'displayName': 'Fotos'
                'id': '31'
                'permalink': 'url'
                'isVisited': false
                'links': []
              }
              {
                'displayName': 'Videos'
                'id': '32'
                'permalink': 'url'
                'isVisited': false
                'links': []
              }
            ]
          }
          {
            'displayName': 'AscensoMX'
            'id': '33'
            'permalink': 'url'
            'isVisited': false
            'links': [
              {
                'displayName': 'Noticias'
                'id': '34'
                'permalink': 'url'
                'isVisited': false
                'links': []
              }
              {
                'displayName': 'Tabla general'
                'id': '35'
                'permalink': 'url'
                'isVisited': false
                'links': [
                  {
                    'displayName': 'Torneo'
                    'id': '36'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                  {
                    'displayName': 'Local/Visitante'
                    'id': '37'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                ]
              }
              {
                'displayName': 'Calendario'
                'id': '38'
                'permalink': 'url'
                'isVisited': false
                'links': [
                  {
                    'displayName': 'Torneo'
                    'id': '39'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                  {
                    'displayName': 'Jornada'
                    'id': '40'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                ]
              }
              {
                'displayName': 'Equipos'
                'id': '41'
                'permalink': 'url'
                'isVisited': false
                'links': [
                  {
                    'displayName': 'Torneo'
                    'id': '42'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                ]
              }
              {
                'displayName': 'Fotos'
                'id': '43'
                'permalink': 'url'
                'isVisited': false
                'links': []
              }
              {
                'displayName': 'Videos'
                'id': '44'
                'permalink': 'url'
                'isVisited': false
                'links': []
              }
            ]
          }
          {
            'displayName': 'CopaMX'
            'id': '45'
            'permalink': 'url'
            'isVisited': false
            'links': [
              {
                'displayName': 'Noticias'
                'id': '46'
                'permalink': 'url'
                'isVisited': false
                'links': []
              }
              {
                'displayName': 'Tabla general'
                'id': '47'
                'permalink': 'url'
                'isVisited': false
                'links': [
                  {
                    'displayName': 'Torneo'
                    'id': '48'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                  {
                    'displayName': 'Local/Visitante'
                    'id': '49'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                ]
              }
              {
                'displayName': 'Calendario'
                'id': '50'
                'permalink': 'url'
                'isVisited': false
                'links': [
                  {
                    'displayName': 'Torneo'
                    'id': '51'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                  {
                    'displayName': 'Jornada'
                    'id': '52'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                ]
              }
              {
                'displayName': 'Equipos'
                'id': '53'
                'permalink': 'url'
                'isVisited': false
                'links': [
                  {
                    'displayName': 'Torneo'
                    'id': '54'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                ]
              }
              {
                'displayName': 'Fotos'
                'id': '55'
                'permalink': 'url'
                'isVisited': false
                'links': []
              }
              {
                'displayName': 'Videos'
                'id': '56'
                'permalink': 'url'
                'isVisited': false
                'links': []
              }
            ]
          }
          {
            'displayName': 'Selección Mexicana'
            'id': '57'
            'permalink': 'url'
            'isVisited': false
            'links': [
              {
                'displayName': 'Noticias'
                'id': '58'
                'permalink': 'url'
                'isVisited': false
                'links': []
              }
              {
                'displayName': 'Torneos'
                'id': '59'
                'permalink': 'url'
                'isVisited': false
                'links': []
              }
              {
                'displayName': 'Calendario'
                'id': '60'
                'permalink': 'url'
                'isVisited': false
                'links': [
                  {
                    'displayName': 'Oficiales'
                    'id': '61'
                    'permalink': 'url'
                    'isVisited': false
                    'links': [
                      {
                        'displayName': 'Copa'
                        'id': '62'
                        'permalink': 'url'
                        'isVisited': false
                        'links': []
                      }
                      {
                        'displayName': 'Torneo'
                        'id': '63'
                        'permalink': 'url'
                        'isVisited': false
                        'links': []
                      }
                    ]
                  }
                  {
                    'displayName': 'Amistosos'
                    'id': '64'
                    'permalink': 'url'
                    'isVisited': false
                    'links': [
                      {
                        'displayName': 'Torneo'
                        'id': '65'
                        'permalink': 'url'
                        'isVisited': false
                        'links': []
                      }
                    ]
                  }
                ]
              }
              {
                'displayName': 'Estadísticas'
                'id': '66'
                'permalink': 'url'
                'isVisited': false
                'links': [
                  {
                    'displayName': 'Torneo'
                    'id': '67'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                  {
                    'displayName': 'Local/Visitante'
                    'id': '68'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                ]
              }
              {
                'displayName': 'Convocados'
                'id': '69'
                'permalink': 'url'
                'isVisited': false
                'links': [
                  {
                    'displayName': 'Torneo'
                    'id': '70'
                    'permalink': 'url'
                    'isVisited': false
                    'links': []
                  }
                ]
              }
              {
                'displayName': 'Fotos'
                'id': '71'
                'permalink': 'url'
                'isVisited': false
                'links': []
              }
              {
                'displayName': 'Videos'
                'id': '72'
                'permalink': 'url'
                'isVisited': false
                'links': []
              }
              {
                'displayName': 'Otras selecciones'
                'id': '73'
                'permalink': 'url'
                'isVisited': false
                'links': []
              }
            ]
          }
        ]
      }
      {
        'displayName': 'Extranjero'
        'id': '74'
        'permalink': 'url'
        'isVisited': false
        'links': []
      }
      {
        'displayName': 'Internacional'
        'id': '75'
        'permalink': 'url'
        'isVisited': false
        'links': []
      }
      {
        'displayName': 'Eliminatorias'
        'id': '76'
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