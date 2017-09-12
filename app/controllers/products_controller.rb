class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]
	
	def index
		if current_user && (current_user.type == "AdminUser")
			@products = Product.paginate(:page => params[:page], :per_page => 6)
		else
			@products = Product.joins(:user).where('users.ban =?', false).paginate(:page => params[:page], :per_page => 6)
		end
	end

	def new
		@product = Product.new
		authorize @product
	end

	def create
		@product = Product.new(product_params)
		@product.user_id = current_user.id
		authorize @product
		if @product.save 
			flash[:notice] = "The product was created successfully"
			redirect_to product_path(@product)
		else
			flash[:warning] = "There was a problem trying to create the product"
			render :new
		end
	end

	def show
		authorize @product
	end

	def edit
		authorize @product
	end

	def update
		authorize @product
		if @product.update(product_params)
			flash[:notice] = "The product was updated successfully"
			redirect_to product_path(@product)
		else
			flash[:warning] = "There was a problem trying to update the product"
			render :edit
		end
	end

	def destroy
		authorize @product
		@product.destroy
		flash[:warning] = "The product was deleted successfully"
		redirect_to products_path
	end

	private
		def set_product
			@product = Product.friendly.find(params[:id])
		end

		def product_params
			#description_attributes  is a method provided by the cocoon gem that allows to use nested attributes for other
			#models.
			params.require(:product).permit(:name, :price, :summary, :image, :category_id,
											descriptions_attributes: [:id, :name, :_destroy])
		end
end