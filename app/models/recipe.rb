class Recipe < ActiveRecord::Base
	belongs_to :user
	belongs_to :menu
	has_many :menus
	validates :name, presence: true
	validates :description, presence: true
	has_many :favorites
    has_many :favoriting_users, through: :favorites, source: :user
	has_many :made_reports, dependent: :destroy
	has_many :ingredients, dependent: :destroy

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
