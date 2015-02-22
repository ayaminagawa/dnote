class Recipe < ActiveRecord::Base
	belongs_to :user
	belongs_to :menu
	has_many :menus
	validates :name, presence: true
	validates :description, presence: true
	has_many :favorites
    has_many :favoriting_users, through: :favorites, source: :user
	has_many :made_reports, dependent: :destroy
end
