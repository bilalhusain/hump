activity = require '../models/activity'

module.exports = (app) ->
	app.get '/camel/:id/activity', (req, res) ->
		activity.getActivity req.params.id, 0, (a) -> res.send JSON.stringify(a) #util.format('%j', a)

