module DeviseWhitelist
	extend ActiveSupport::Concern

	included do
		before_action :configure_permitted_parameters, if: :devise_controller?
	end

	def configure_permitted_parameters 
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :shop_name, :website, :shop_description])
		devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :shop_name, :website, :shop_description])
	end
end