module Admin
	class CategoriesController < Admin::ApplicationController
		def show
    	requested_resource = find_object(Category)
      render locals: {
        page: Administrate::Page::Show.new(dashboard, requested_resource),
      }
    end

    def edit
    	requested_resource = find_object(Category)
    	render locals: {
        page: Administrate::Page::Form.new(dashboard, requested_resource),
      }
    end

    def update
      requested_resource = find_object(Category)
      if requested_resource.update(resource_params)
        redirect_to(
          [namespace, requested_resource],
          notice: translate_with_resource("update.success"),
        )
      else
        render :edit, locals: {
          page: Administrate::Page::Form.new(dashboard, requested_resource),
        }
      end
    end

    def destroy
      requested_resource = find_object(Category)
      requested_resource.destroy
      flash[:notice] = translate_with_resource("destroy.success")
      redirect_to action: :index
    end
	end
end