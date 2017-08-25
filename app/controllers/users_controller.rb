class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update ]

	#The new action is provided by devise, the only thing that we need to permit the first_name and last_name is
	#the creation of a concern file to allow us to use the attributes, the file is under 
	#controller/concerns/devise_whitelist, once that we have that we need to include the call in the application_controller

	def index
		@users = User.paginate(:page => params[:page], :per_page => 6)
	end

	def show
	end

	def edit
		authorize @user
	end
	
	def update
		#authorize @user
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
			params.require(:user).permit(:first_name, :last_name, :email, :image, :phone)
		end

		def set_user
			@user = User.friendly.find(params[:id])
		end
end