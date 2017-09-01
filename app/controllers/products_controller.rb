class ProductsController < ApplicationController
	def index
		@products = Product.paginate(:page => params[:page], :per_page => 6)
	end

	def show
		@product = Product.friendly.find(params[:id])
	end
end