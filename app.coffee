
###
Module dependencies.
###
express = require("express")
http = require("http")
path = require("path")

app = express()

app.configure ->
  app.set "port", process.env.PORT or 3011
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(path.join(__dirname, "public"))
  app.use express.static(path.join(__dirname, "components"))

app.configure "development", ->
  app.use express.errorHandler()

app.get "/", (req,res)->
  res.render "index"

app.get "/privacy-policy/", (req,res)->
  res.render "privacy-policy"

app.get "/portfolio/", (req,res)->
  res.redirect "/"

http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")

