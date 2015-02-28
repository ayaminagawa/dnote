class Ingredient < ActiveRecord::Base
	belongs_to :recipe , :class_name => "Recipe"
	validates :name, presence: true
end
