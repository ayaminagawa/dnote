class Menu < ActiveRecord::Base
	belongs_to :user
	# validates :name, presence: true
	has_many :recipes
	has_many :favorites
    has_many :favoriting_users, through: :favorites, source: :user
	has_many :menu_recipes
end
