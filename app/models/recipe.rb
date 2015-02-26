class Recipe < ActiveRecord::Base
	belongs_to :user
	belongs_to :menu
	has_many :menus
	has_many :menu_recipes
	validates :name, presence: true
	validates :description, presence: true
	has_many :favorites
    has_many :favoriting_users, through: :favorites, source: :user
	has_many :made_reports, dependent: :destroy
	has_many :ingredients, :class_name => "Ingredient", dependent: :destroy
	accepts_nested_attributes_for :ingredients, :allow_destroy => true
	has_many :procedures, :class_name => "Procedure", :dependent => :destroy
  	accepts_nested_attributes_for :procedures, :allow_destroy => true
  	

    
  	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/system/missing/:style/missing.jpg"

  	validates_attachment :image, presence: true,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { less_than: 2.megabytes }
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
 
  # def authenticated_image_url(style)
  #   image.s3_object(style).url_for(:read, :secure => true)
  # end

	def self.search(search) #self.でクラスメソッドとしている
	    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
	      # Recipe.where(['name LIKE ?', "%#{search}%"])
	      # Recipe.where(['tip LIKE ?', "%#{search}%"])
	      Recipe.where(['name LIKE ? or tip LIKE ? or description LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
	    else
	      Recipe.all #全て表示。
	    end
  	end
end
