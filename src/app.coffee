window.$ = require('jquery')
window.Backbone = require('backbone')
window._ = require('underscore')
Backbone.$ = $
Backbone.Marionette = require('backbone.marionette')

#Backbone.$.ajaxPrefilter (options, originalOptions, jqXHR) ->
#	options.xhrFields =
#		withCredentials: true

class MyApplication extends Backbone.Marionette.Application
	Models:{}
	Controllers:{}
	Views:{}
	Templates:{}
	baseUrl: 'http://localhost:3000/api'
	apiVersion: 1.0

window.Application = new MyApplication()
Application.on('start',(options)->
	new Application.Controllers.ApplicationController();
	$('.version').text(Application.apiVersion)
	console.log 'API Version: ' + Application.apiVersion
)

Application.apiVersion = 2.0

if Application.apiVersion is 1.0
	Application.Controllers.ApplicationController = require("1/controllers/ApplicationController")
	Application.Controllers.ProductsController = require("1/controllers/ProductsController")
else if Application.apiVersion is 2.0
	Application.Controllers.ProductsController = require("2/controllers/ProductsController")
	Application.Controllers.ApplicationController = require("1/controllers/ApplicationController")

Application.start()
