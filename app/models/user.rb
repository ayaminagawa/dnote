class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	# validates :name, length: { maximum: 15 }, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	# validates :gender, presence: true
	# validates :email, presence: true,format: { with: VALID_EMAIL_REGEX }, uniqueness: true
	has_many :recipes, dependent: :destroy
	has_many :menus, dependent: :destroy 
	# has_secure_password
    validates :password, length: { minimum: 6 }

    def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image = file_name
    end
  end
end
