module Admin
  def self.admin_types
    ["AdminUser"]
  end

  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin

    def authenticate_admin
      unless Admin.admin_types.include?(current_user.try(:type))
        flash[:alert] = "You are not authorized to access this page"
        redirect_to root_path
      end
    end

    def index
     search_term = params[:search].to_s.strip
     resources = Administrate::Search.new(scoped_resource, dashboard_class, search_term).run
     resources = order.apply(resources)
     resources = resources.paginate(:page => params[:page])     
     page = Administrate::Page::Collection.new(dashboard, order: order)

      render locals: {
        resources: resources,
        search_term: search_term,
        page: page,
        show_search_bar: show_search_bar?
      }
    end
  end
end
