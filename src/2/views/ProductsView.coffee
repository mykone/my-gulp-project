#ProductsView, Version 2.0

ProductsViewBase = require('1/views/ProductsView')

class ProductsView extends ProductsViewBase

	initialize:(options={})->
		super(options)
		console.log 'ProductsView V2 initialized'
		return

	onRender:->
		console.log 'hiding products view'
		return

module.exports = ProductsView
