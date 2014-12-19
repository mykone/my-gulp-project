#ApplicationController, Version 1.0

class ApplicationController extends Backbone.Marionette.Controller
	# regions:
		# newProductRegion: '#new-product-region'
		# productsRegion: '#products-region'

	initialize:->
		console.log 'ApplicationController V1 initialized'

		productsController = new Application.Controllers.ProductsController()
		productsController.getProducts()

		$('#newProductButton').click ->
			Application.vent.trigger('new:product:event')
		return

module.exports = ApplicationController
