class CreateJournals < ActiveRecord::Migration[6.1]
  def change
    create_table :journals do |t|
      t.string :name
      t.text :description
      t.integer :user_id 
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
