mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/db', {auto_reconnect: true, poolSize: 4}

camel = require '../app/models/camel'

c = new camel()
c.name = 'Fringe'
c.about = 'I am a cool camel'
c.save (err) ->
	console.log if err then "oops #{err}" else "added a camel id: #{c._id}"

