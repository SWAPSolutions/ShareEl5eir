class CreateCloths < ActiveRecord::Migration
  def change
    create_table :cloths do |t|
      t.string :size
      t.string :color
      t.integer :user_id
      t.integer :quantity
      t.text :description
      t.boolean :donated

      t.timestamps null: false
    end
  end
end
