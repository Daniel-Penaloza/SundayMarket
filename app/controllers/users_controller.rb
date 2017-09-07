class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update ]

	def index
		@users = User.paginate(:page => params[:page], :per_page => 6)
	end

	def show
	end

	def edit
		authorize @user
	end
	
	def update
		authorize @user
		if @user.update(user_params)
			flash[:notice] = "The user #{@user.full_name} was updated successfully."
			redirect_to seller_path(@user)
		else
			flash[:warning] = "There was a problem trying to update the user."
			render :edit
		end
	end

	def products
		@user = User.friendly.find(params[:id])
		@user_products = User.friendly.find(params[:id]).products.paginate(:page => params[:page], :per_page => 6)
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :image, :password, 
										 :password_confirmation, :shop_name, :website, :shop_description )
		end

		def set_user
			@user = User.friendly.find(params[:id])
		end
end