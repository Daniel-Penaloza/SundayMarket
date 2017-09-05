class HomeController < ApplicationController
	def index
		@categories = Category.shuffle_images
	end
end