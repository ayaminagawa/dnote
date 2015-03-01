class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :omniauthable, :recoverable,
         :registerable, :rememberable, :trackable, omniauth_providers: [:twitter, :facebook]
 
 
	validates :name, length: { maximum: 15 }, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	# validates :gender, presence: true
	# validates :email, presence: true,format: { with: VALID_EMAIL_REGEX }, uniqueness: true

	has_many :menus, dependent: :destroy 
  has_many :recipes, dependent: :destroy 
  has_many :made_reports, dependent: :destroy
	# has_secure_password
  # validates :password, length: { minimum: 6 }

  has_many :favorites
  has_many :favorite_recipes, through: :favorites, source: :recipe
  has_many :favorite_menus, through: :favorites, source: :menu


  # has_attached_file :image,
  #                   # :styles => {
  #                   #     :thumb  => "100x100",
  #                   #     :medium => "200x200",
  #                   #     :large => "600x400"
  #                   # },
  #                   :storage => :s3,
  #                   :s3_permissions => :private,
  #                   :s3_credentials => "#{Rails.root}/config/s3.yml",
  #                   :path => ":attachment/:id/:style.:extension"
 
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
 
  # def authenticated_image_url(style)
  #   image.s3_object(style).url_for(:read, :secure => true)
  # end

    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/system/missing/:style/missing.jpg"

    validates_attachment :image, 
    content_type: { content_type: ["image/jpg", "image/png"] },
    size: { less_than: 2.megabytes }



  
    def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image = file_name
      end
    end

      # 通常サインアップ時のuid用、Twitter OAuth認証時のemail用にuuidな文字列を生成
    def self.create_unique_string
      SecureRandom.uuid
    end

      # twitterではemailを取得できないので、適当に一意のemailを生成
    def self.create_unique_email
      User.create_unique_string + "@example.com"
    end


    def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
      user = User.where(:provider => auth.provider, :uid => auth.uid).first
      unless user
        user = User.create!(name:     auth.extra.raw_info.name,
                           provider: auth.provider,
                           uid:      auth.uid,
                           email:    auth.info.email,
                           password: Devise.friendly_token[0,20]
                          )
      end
      user
    end

    def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
      user = User.where(:provider => auth.provider, :uid => auth.uid).first
      unless user
        user = User.create(name:     auth.info.nickname,
                           provider: auth.provider,
                           uid:      auth.uid,
                           email:    User.create_unique_email,
                           password: Devise.friendly_token[0,20]
                          )
      end
      user
    end

    def favorite_recipe?(recipe)
      favorites.find_by(recipe_id: recipe.id)
    
    end

    def favorite_recipe!(recipe)
      favorites.create!(recipe_id: recipe.id)
    end

    def unfavorite_recipe!(recipe)
      favorites.find_by(recipe_id: recipe.id).destroy
    end

    def favorite_menu?(menu)
      favorites.find_by(menu_id: menu.id)
    end

    def favorite_menu!(menu)
      favorites.create!(menu_id: menu.id)
    end

    def unfavorite_menu!(menu)
      favorites.find_by(menu_id: menu.id).destroy
    end

end