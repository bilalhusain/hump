express = require 'express'
mongoose = require 'mongoose'
util = require 'util'

mongoose.connect 'mongodb://localhost/db', {auto_reconnect: true, poolSize: 4}
camel = require './app/models/camel'

app = express.createServer()

app.configure () ->
	app.set 'views', __dirname + '/app/views/'
	app.set 'view engine', 'jade'
	app.use express.static __dirname + '/public'

app.get '/', (req, res) ->
	res.render 'profile', {layout: false}

app.get '/camel/:id', (req, res) ->
	camel.getProfile req.params.id, (c) -> res.send JSON.stringify(c) #util.format('%j', c)

app.listen 3007

