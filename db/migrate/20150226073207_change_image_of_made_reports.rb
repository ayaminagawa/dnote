class ChangeImageOfMadeReports < ActiveRecord::Migration
  def self.up
    change_table :made_reports do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :made_reports, :image
  end
end
