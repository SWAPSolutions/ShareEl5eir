class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :f_name
      t.string :l_name
      t.integer :role
      t.text :bio
      t.string :phone
      t.string :address
      t.string :photo
      t.integer :devise_id

      t.timestamps null: false
    end
  end
end
