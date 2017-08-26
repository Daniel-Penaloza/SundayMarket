module Admin
  class UsersController < Admin::ApplicationController
    def find_resource(param)
        User.find_by!(slug: param)
    end
  end
end
