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


	Hump.Models.Activity = Backbone.Model.extend {}

	Hump.Collections.Activities = Backbone.Collection.extend
		model: Hump.Models.Activity
		url: () -> '/hump/camel/' + this.camel + '/activity'

	Hump.Views.Activity = Backbone.View.extend
		model: Hump.Models.Activity
		tagName: 'div'
		className: 'activity'
		template: _.template($('#activity-template').html())

		initialize: () ->
			this.model.view = this

		render: () ->
			$(this.el).html(this.template(this.model.toJSON()))
			this

	Hump.Views.Activities = Backbone.View.extend
		el: '#activities'

		initialize: () ->
			_.bindAll(this, 'render')
			this.collection.bind('reset', this.render)

		render: () ->
			$(this.el).empty()

			this.collection.each (activity) =>
				view = new Hump.Views.Activity {model: activity}
				$(this.el).append(view.render().el)

			this


	Hump.Routers.Main = Backbone.Router.extend
		routes:
			'': 'index'
			'profile/:id': 'profile'

		index: () ->

		profile: (id) ->
			profile = new Hump.Models.Profile {_id: id}
			new Hump.Views.Profile {model: profile}
			profile.fetch()
			activities = new Hump.Collections.Activities
			activities.camel = id
			new Hump.Views.Activities {collection: activities}
			activities.fetch()

	Hump.init()

