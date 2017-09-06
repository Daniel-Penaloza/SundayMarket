class HomeController < ApplicationController
	def index
		@categories = Category.all[0..17]
	end
end