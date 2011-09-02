mongoose = require 'mongoose'

camelSchema = new mongoose.Schema
	#_id: Object
	name: String
	humps: {type: Number, default: 1}
	dp: {type: String, default: '{some generic shadow pic url here}'}
	about: String

camelSchema.statics.getProfile = (id, callback) ->
	this.findOne {_id: id}, (err, c) ->
		return throw 'not found' if err or not c
		callback(c)

mongoose.model 'hump_camel', camelSchema
module.exports = mongoose.model 'hump_camel'

