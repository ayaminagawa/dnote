class Menu < ActiveRecord::Base
	belongs_to :user
	# validates :name, presence: true
	has_many :recipes
	has_many :favorites
    has_many :favoriting_users, through: :favorites, source: :user
	has_many :menu_recipes
	validates :name, presence: true
	validates :point, presence: true
	validates :category, presence: true
	has_many :categories

	
  	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/system/missing/:style/missing.jpg"

  	validates_attachment :image,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { less_than: 2.megabytes }
end
