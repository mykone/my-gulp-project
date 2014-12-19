#ProductsController, Version 1.0

ProductsCollection = require('1/collections/ProductsCollection')
Application.Views.ProductsView = require('1/views/ProductsView')

class ProductsController extends Backbone.Marionette.Controller
	@NewProductView: require('1/views/NewProductView')

	initialize:->
		console.log 'ProductsController V1 initialized'
		productView = new Application.Controllers.ProductsController.NewProductView()
		@listenTo productView, 'save:completed:event', @onSaveCompleted
		return

	getProducts:->
		console.log 'Fetching products ...yyy.. '
		productsCollection = new ProductsCollection()

		@listenTo productsCollection, 'success', @onGetProducts
		@listenTo productsCollection, 'sync', @onGetProducts
		productsCollection.fetch()
		return

	onGetProducts:(collection, response)->
		console.log 'Fetch products completed, zeen?!!!'
		new Application.Views.ProductsView(collection:collection)
		return

	onSaveCompleted:->
		console.log "saveCompleted Zeen: %o",@
		@getProducts()
		return

module.exports = ProductsController
