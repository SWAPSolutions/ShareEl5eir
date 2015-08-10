class RenameUserColumn < ActiveRecord::Migration
  def self.up
  	rename_column :cloths , :user_id , :member_id
  	rename_column :medicines , :user_id , :member_id
  end

  def self.down
  	rename_column :cloths , :member_id , :user_id
  	rename_column :medicines , :member_id , :user_id
  end
end
