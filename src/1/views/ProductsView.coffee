#ProductsView, Version 1.0

class ProductsView extends Backbone.Marionette.CollectionView
	el: '.products'
	tagName: 'ul'
	childView: require('1/views/ProductView')

	initialize:(options={})->
		console.log "ProductsView V1 initialized"
		@render()
		return

module.exports = ProductsView
