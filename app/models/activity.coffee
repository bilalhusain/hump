mongoose = require 'mongoose'

activitySchema = new mongoose.Schema
	#_id: Object
	camel: mongoose.Schema.ObjectId # foreign key
	log: String
	when: {type: Date, default: new Date()} 

activitySchema.statics.getActivity = (camel, page, callback) ->
	this.find {camel: camel}, (err, a) ->
		return throw 'not found' if err or not a
		callback(a)

mongoose.model 'hump_activity', activitySchema
module.exports = mongoose.model 'hump_activity'

