ProductModel = require '1/models/ProductModel'

class ProductsCollection extends Backbone.Collection
	url: Application.baseUrl + '/products/'
	model: ProductModel

module.exports = ProductsCollection
