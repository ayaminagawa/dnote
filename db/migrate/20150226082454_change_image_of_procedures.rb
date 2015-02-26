class ChangeImageOfProcedures < ActiveRecord::Migration
  def self.up
    change_table :procedures do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :procedures, :image
  end
end
