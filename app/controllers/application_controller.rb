class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, only: [:edit, :update]
  include DeviseWhitelist
end
