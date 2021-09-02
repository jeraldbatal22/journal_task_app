class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.text :firstname
      t.text :lastname
      t.string :password_digest
      t.text :email
      t.integer :status
      t.integer :gender
      t.string :image
      t.timestamps
    end
  end
end
