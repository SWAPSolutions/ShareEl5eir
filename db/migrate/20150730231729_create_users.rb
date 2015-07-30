class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.integer :role
      t.text :bio
      t.string :phone
      t.text :address
      t.text :photo
      t.integer :device_id

      t.timestamps null: false
    end
  end
end
