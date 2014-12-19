#ProductsController, Version 2.0

ProductsControllerBase = require('1/controllers/ProductsController')
Application.Views.ProductsView = require('2/views/ProductsView')

class ProductsController extends ProductsControllerBase

	initialize:->
		super()
		console.log 'ProductsController V2 initialized. Sweet!!'
		return

module.exports = ProductsController
