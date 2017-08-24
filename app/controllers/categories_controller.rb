class CategoriesController < ApplicationController
    
    before_action :set_category, only: [:edit, :update, :show, :destroy]

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path(@category)
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category successfully updated"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def show
    #@category_products = @category.products
  end
  
  def index
    #@categories = Category.paginate(page: params[:page], per_page: 5)
    @categories = Category.all
  end
  
  def destroy
    @category.destroy
    #flash[:success] = "Goal successfully deleted!"
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])  
  end
  
  def category_params
    params.require(:category).permit(:name, :cat_image)
  end
  
end