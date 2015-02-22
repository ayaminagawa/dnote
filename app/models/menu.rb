class Menu < ActiveRecord::Base
	belongs_to :user
	# validates :name, presence: true
	has_many :recipes
	has_many :menu_recipes
end
