class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :list_name, null: false
      t.index :list_name

      t.timestamps
    end
  end
end
