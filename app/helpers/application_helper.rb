module ApplicationHelper
	def current_user_object(id)
		return true if current_user.id == id
	end

	def admin_type_user?
		User.admin_types.include?(current_user.try(:type))
	end

	#---------------Checks the url given by the user for the site----------------#
  def check_url(url)
    return true if /^(?:(?:https\:\/\/))|(?:(?:http\:\/\/))/.match(url)
    return false
  end

  def format_url(url)
    if check_url(url)
      return url
    else
      return ('http://' << url)
    end
  end
end