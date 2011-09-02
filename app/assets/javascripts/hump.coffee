$ () ->
	Backbone.emulateHTTP = true

	Hump =
		Models: {}
		Views: {}
		Collections: {}
		Routers: {}
		init: () ->
			new Hump.Routers.Main()
			Backbone.history.start()


	Hump.Models.Profile = Backbone.Model.extend
		url: () -> '/hump/camel/' + this.get('_id')


	Hump.Views.Profile = Backbone.View.extend
		el: '#profile'
		template: _.template($('#profile-template').html())

		initialize: () ->
			_.bindAll this, 'render'
			this.model.bind 'change', this.render

		render: () ->
			$(this.el).html(this.template(this.model.toJSON()))


	Hump.Routers.Main = Backbone.Router.extend
		routes:
			'': 'index'
			'profile/:id': 'profile'

		index: () ->

		profile: (id) ->
			profile = new Hump.Models.Profile {_id: id}
			new Hump.Views.Profile {model: profile}
			profile.fetch()


	Hump.init()

