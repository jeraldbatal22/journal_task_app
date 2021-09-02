class RemoveStatusAndGenderAndImageAndPasswordSaltFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :status, :interger
    remove_column :users, :gender, :integer
    remove_column :users, :image, :string
    remove_column :users, :password_salt, :string
  end
end
