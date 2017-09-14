class Product < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :descriptions
	accepts_nested_attributes_for :descriptions,
								  allow_destroy: true,
								  reject_if: lambda {|attrs| attrs['name'].blank? }
	# user & category ID are both required through the belongs_to association
	# Description is an array and optional, with a 100 max chars per array item (which will be a line in a list item)
	
  	validates :name, presence:true, length: {minimum: 3, maximum: 240}
  	validates :price, numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 5000 }
  	validates :summary, presence:true, length: {minimum: 4, maximum: 500}
  	validate :description_numbers

  	def description_numbers
  		errors.add(:descriptions, "(need to have 3 descriptions for your product)") if descriptions.size != 3
  	end

  	default_scope -> { order(updated_at: :desc) }

  	mount_uploader :image, ProductImageUploader

  	extend FriendlyId
	friendly_id :name, use: :slugged
end