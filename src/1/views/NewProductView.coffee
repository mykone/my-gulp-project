#NewProductView, Version 1.0

ProductModel = require '1/models/ProductModel'
Application.Templates.NewProductView = require '1/templates/NewProductView'

class NewProductView extends Backbone.Marionette.ItemView
	el: '.new-record'
	isRendered:false
	template: Application.Templates.NewProductView
	events:
		'click #saveProductButton': 'onSaveProductClick'
		'click #cancelButton': 'onCancelButtonClick'
	ui:
		saveProductButton : '#saveProductButton'
		name : '#name'
		sku : '#sku'

	initialize:(options={})->
		console.log 'NewProductView initialized'
		@listenTo Application.vent, 'new:product:event', @onNewProduct
		return

	onRender:->
		@ui.saveProductButton = $('#saveProductButton')
		@ui.saveProductButton.removeClass('disabled')

		@ui.name = $('#name')
		@ui.sku = $('#sku')
		@ui.price = $('#price')

		@ui.name.focus()

		@isRendered = true

		return

	onSaveProductClick:(e)->

		ProductModel.prototype.url = Application.baseUrl + '/products/'

		productModel = new ProductModel(
			'name': @ui.name.val()
			'sku': @ui.sku.val()
			'price': @ui.price.val()
		)

		@listenTo productModel, 'sync', @onSaveCompleted
		productModel.save()
		return

	onSaveCompleted:->
		@trigger('save:completed:event')
		return

	onNewProduct:->
		if @isRendered
			@$el.show()
		else
			@render()
		return

	onCancelButtonClick:->
		@$el.hide()
		return

module.exports = NewProductView
