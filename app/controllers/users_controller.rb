class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update ]

	#The new action is provided by devise, the only thing that we need to permit the first_name and last_name is
	#the creation of a concern file to allow us to use the attributes, the file is under 
	#controller/concerns/devise_whitelist, once that we have that we need to include the call in the application_controller

	def index
		@users = User.page(params[:page]).per(6)
	end

	def show
	end

	def edit
	end
	
	def update
		#If the current_user signed in is the owner or if the current_user is type AdminUser then proceed to update
		if current_user.id == @user.id || User.admin_types.include?(current_user.try(:type))
			if @user.update(user_params)
				flash[:notice] = "The user #{@user.full_name} was updated successfully."
				redirect_to seller_path(@user)
			else
				flash[:warning] = "There was a problem trying to update the user."
				render :edit
			end
		end
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :image, :phone)
		end

		def set_user
			@user = User.friendly.find(params[:id])
		end
end