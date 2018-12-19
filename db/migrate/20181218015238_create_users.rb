class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.integer :recently_viewed_list, null: false
      
      t.timestamps
    end
  end
end
