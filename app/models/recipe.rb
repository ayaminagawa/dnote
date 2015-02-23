class Recipe < ActiveRecord::Base
	belongs_to :user
	belongs_to :menu
	has_many :menus
	has_many :menu_recipes
	validates :name, presence: true
	validates :description, presence: true
end
