class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, only: [:edit, :update]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  include DeviseWhitelist
  include Pundit

  def user_not_authorized
  	flash[:danger] = "You are not authorized to perform this action."
  	redirect_to(root_path)
  end
end
