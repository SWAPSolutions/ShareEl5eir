class AddMembersOrgsColsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :f_name, :string
    add_column :users, :l_name, :string
    add_column :users, :bio, :string
    add_column :users, :role, :integer
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :name, :string
    add_column :users, :description, :string
    add_column :users, :website, :string
    add_column :users, :photo, :string
  end
end
