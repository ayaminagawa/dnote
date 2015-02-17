class RemovePasswordDigestFromUser < ActiveRecord::Migration
  def change
  	remove_columns(:users, :password_digest)
  end
end
