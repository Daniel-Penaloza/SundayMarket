module Admin
  class AdminUsersController < Admin::ApplicationController
    def find_resource(param)
      AdminUser.find_by!(slug: param)
    end
  end
end
