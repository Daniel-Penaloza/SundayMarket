class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #-----------------------Associations-------------------#
  has_many :products
  has_many :categories, :through  => :products

  #-----------------------Validations-------------------#
  validates_presence_of :first_name, :last_name
  mount_uploader :image, UserImageUploader

  def self.admin_types
  	["AdminUser"]
  end

  #-----------------------Permalink-------------------#
  extend FriendlyId
  friendly_id :full_name, use: [:slugged]

  def full_name
    ("#{first_name} #{last_name}").titleize
  end
end