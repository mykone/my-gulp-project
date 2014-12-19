require('backbone.modelBinder')

class ProductView extends Backbone.Marionette.ItemView
	template: require('1/templates/ProductView')
	tagName: 'li'
	events:
		'click .name': 'onProductClick'
		'click .close' : 'onProductClose'
		'click #deleteButton': 'onDeleteButtonClick'
		'click .updateButton': 'onUpdateButtonClick'

	onProductClick:(e)->
		@$el.find('.product-details').slideDown()
		return

	onUpdateButtonClick:(e)->
		shouldSave = true #confirm('Are you sure?')
		if true or @model.hasChanged(@model.attributes) and shouldSave is true
			console.log 'Changed, updating'
			@model.save()
		else
			console.log 'No changes, skipping updates'
		return

	onDeleteButtonClick:(e)->
		# @$el.find('.product-details').slideDown()
		shouldDelete = confirm('Are you sure?')
		if shouldDelete is true
				@model.destroy()
				# console.log @model
		return

	onRender:->
		if !@model?
			return
		@listenTo @model, 'change', @onModelChanged
		modelBinder = new Backbone.ModelBinder()
		modelBinder.bind @model,@.el
#		modelBinder.watch('value: name',{ selector: '[name="name"]' })
#		modelBinder.watch('text: name',{ selector: '.name' })
#
#		modelBinder.watch('value: price',{ selector: '[name="price"]' })
#		modelBinder.watch('value: sku',{ selector: '[name="sku"]' })
		return

	onModelChanged:->
		console.log 'model changed'
		return

	onProductClose:(e)->
		@$el.find('.product-details').hide()
		return

module.exports = ProductView
