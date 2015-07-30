class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.string :website
      t.text :photo
      t.integer :device_id

      t.timestamps null: false
    end
  end
end
