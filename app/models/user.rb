class User < ActiveRecord::Base
	validates :name, length: { maximum: 15 }, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :gender, presence: true
	validates :email, presence: true,format: { with: VALID_EMAIL_REGEX }, uniqueness: true
	has_many :recipes, dependent: :destroy
	has_secure_password
    validates :password, length: { minimum: 6 }
end
