class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :show, :destroy]

  def index
    @categories = Category.paginate(:page => params[:page], :per_page => 6)
  end

  def show
  end

  def new
    @category = Category.new
    authorize @category
  end
  
  def create
    authorize @category
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path(@category)
      flash[:notice] = "The category was created successfully."
    else
      render :new
    end
  end
  
  def edit
    authorize @category
  end

  def update
    authorize @category
    if @category.update(category_params)
      flash[:notice] = "Category successfully updated."
      redirect_to category_path(@category)
    else
      render :edit
    end
  end
  
  def destroy
    @category.destroy
    flash[:notice] = "Category successfully deleted!"
    redirect_to categories_path
  end

  private
    def set_category
      @category = Category.friendly.find(params[:id])
    end
  
    def category_params
      params.require(:category).permit(:name, :cat_image)
    end
  
end