express = require 'express'

app = express.createServer()

app.configure () ->
	app.use express.static __dirname + '/public'

app.listen 3007

