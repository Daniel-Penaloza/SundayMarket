module ApplicationHelper
	def current_user_object(id)
		return true if current_user.id == id
	end

	def admin_type_user?
		User.admin_types.include?(current_user.try(:type))
	end	
end