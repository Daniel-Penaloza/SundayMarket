class ProductsController < ApplicationController
	def index
		#byebug
		@all_products = Product.all
		@products = current_user.products
	end
end