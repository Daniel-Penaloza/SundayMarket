class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    @product.description.split(',')
		if @product.save
      flash[:success] = "Product has been added to the catalogue"
      redirect_to products_path
    else
      flash[:warning] = "Product has not been added to the catalogue"
      render 'new'
    end
	end
	
private
	def set_product
		@product = Product.friendly.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:category_id, :name, :price, :summary, description: [])
	end
end