class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update]
	def index
		@products = Product.paginate(:page => params[:page], :per_page => 6)
	end

	def show
	end

	def edit
		descriptions = @product.description
	end

	def update
		if @product.update(product_params)
			flash[:notice] = "The product was updated successfully"
			redirect_to product_path(@product)
		else
			flash[:warning] = "There was a problem trying to update the product"
			render :edit
		end
	end

	private
		def set_product
			@product = Product.friendly.find(params[:id])
		end

		def product_params
			params.require(:product).permit(:name, :price, :summary, :image,
											descriptions_attributes: [:id, :name, :_destroy])
		end
end