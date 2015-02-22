class Recipe < ActiveRecord::Base
	belongs_to :user
	belongs_to :menu
	has_many :menus
	validates :name, presence: true
	validates :description, presence: true

	has_many :made_reports, dependent: :destroy
end
