class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #-----------------------Associations-------------------#
  has_many :products, dependent: :destroy
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

  #-----------Avoiding The Repeated Elements In The User Categories------------#
  def category_no_repeated
      self.categories.distinct.pluck(:id, :name)
  end

  #-----------------------Adding A Default Image To The User -------------------#
  before_create :asign_image

  private
    def asign_image
      self.image = File.open(File.join(Rails.root,'app/assets/images/user_image.png'))
    end
end