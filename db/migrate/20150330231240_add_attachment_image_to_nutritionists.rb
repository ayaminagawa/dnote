class AddAttachmentImageToNutritionists < ActiveRecord::Migration
  def self.up
    change_table :nutritionists do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :nutritionists, :image
  end
end
