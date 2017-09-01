class ProductsController < ApplicationController
  
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_product, only: [:show, :edit, :update, :destroy] 
  
    def index
      @products = Product.all
    end
  
    def new
      @product = Product.new
    end
  
    def create
      @product = Product.new(product_params)
      @product.user = current_user
      @product.description.split(',')
      if @product.save
        flash[:success] = "Product has been added to the catalogue"
        redirect_to products_path
      else
        flash[:warning] = "Product has not been added to the catalogue"
        render 'new'
      end
    end
  
    def edit
    end
  
    def update
      @product.description.split(',')
      if @product.update(product_params)
        flash[:success] = "Product has been updated"
        redirect_to products_path
      else
        render 'edit'
      end
    end
  
    def show
    end
  
    def destroy
      @product.destroy
      flash[:danger] = "product has been removed from the catalogue"
      redirect_to products_path
    end
  
    private
      def set_product
        @product = Product.find(params[:id])
      end
      def product_params
        params.require(:product).permit(:category_id, :name, :price, :summary, description: [])
      end
  end