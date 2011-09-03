mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/db', {auto_reconnect: true, poolSize: 4}

camel = require '../app/models/camel'
activity = require '../app/models/activity'

c = new camel()
c.name = 'Fringe'
c.about = 'I am a cool camel'
c.save (err) ->
	if err
		console.log "oops #{err} while adding a camel"
		return

	console.log "added a camel id: #{c._id}"

	a = new activity()
	a.camel = c._id
	a.log = 'Joined hump.'
	a.save (err) ->
		if err
			console.log "oops #{err} while adding activity"
			return

		console.log "added activity: #{a._id}"

