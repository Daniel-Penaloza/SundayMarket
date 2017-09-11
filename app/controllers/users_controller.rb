class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy, :ban_seller, :unban_seller]

	def index

		if current_user && (current_user.type == "AdminUser")
			@users = User.all.paginate(:page => params[:page], :per_page => 6)
		else
			@users = User.where('ban = ?', false).paginate(:page => params[:page], :per_page => 6)
		end
	end

	def show
		authorize @user
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

	def destroy
		@user.delete
		flash[:danger] = "The user was deleted successfully"
		redirect_to sellers_path
	end
	
	def products
		@user = User.friendly.find(params[:id])
		@user_products = User.friendly.find(params[:id]).products.paginate(:page => params[:page], :per_page => 6)
	end

	def ban_seller
		authorize @user
		if @user.update(ban: true)
      flash[:notice] = 'The user was successfully banned'
      redirect_to sellers_path
    else
      flash[:alert] = 'The user could not be banned'
      redirect_to seller_path(@user)
    end
	end

	def unban_seller
		authorize @user
		@user.ban = false
		if @user.save
      flash[:notice] = 'The user was successfully unbanned'
      redirect_to sellers_path
    else
      flash[:alert] = 'The user could not be unbanned'
      redirect_to seller_path(@user)
    end
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :image, :shop_name, :website, :shop_description, :ban)
		end

		def set_user
			@user = User.friendly.find(params[:id])
		end
end