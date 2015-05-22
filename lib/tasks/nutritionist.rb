# 使用するモデルファイル(test)を読み込む
require "#{Rails.root}/app/models/nutritionist"
require "#{Rails.root}/app/models/user"


class Tasks::NutritionistTask
  def self.execute
    nutritionists = Nutritionist.all

    nutritionists.each do |nutritionist|
      user1 = User.new
      user1.email = nutritionist.email
      user1.encrypted_password = nutritionist.encrypted_password
      user1.name = nutritionist.user
      user1.nutritionist_description = nutritionist.description
      user1.permission = nutritionist.permission
      user1.save
    end

    
  end
end