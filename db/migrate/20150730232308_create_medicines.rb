class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :name
      t.date :exp_date
      t.string :concentration
      t.integer :quantity
      t.text :description
      t.boolean :donated
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
