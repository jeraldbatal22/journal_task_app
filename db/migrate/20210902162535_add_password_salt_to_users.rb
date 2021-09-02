class AddPasswordSaltToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :password_salt, :string
  end
end
