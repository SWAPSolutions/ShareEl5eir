class RenameUserColumn < ActiveRecord::Migration
  def self.up
  	rename_column :colths , :user_id , :member_id
  end

  def self.down
  	rename_column :cloths , :member_id , :user_id
  end
end
