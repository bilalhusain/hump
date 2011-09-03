camel = require '../models/camel'

module.exports = (app) ->
	app.get '/camel/:id', (req, res) ->
		camel.getProfile req.params.id, (c) -> res.send JSON.stringify(c) #util.format('%j', c)

