class UpdateStructureOfUser < ActiveRecord::Migration[5.2]
  def change
      add_index :users, :email,                unique: true
      add_index :users, :reset_password_token, unique: true
      
      remove_column :users, :mail
      remove_column :users, :pwd
  end
end
