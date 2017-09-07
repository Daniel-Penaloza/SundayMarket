class HomeController < ApplicationController
	def index
		@categories = Category.limit(18)
	end
end