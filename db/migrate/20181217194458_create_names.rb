class CreateNames < ActiveRecord::Migration[5.2]
  def change
    create_table :names do |t|
      t.string :baby_name, null: false
      t.string :crossed_out, null: false
      t.belongs_to :list

      t.timestamps
    end
  end
end
