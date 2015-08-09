class AddAttachmentPhotoToOrganizations < ActiveRecord::Migration
  def self.up
    change_table :organizations do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :organizations, :photo
  end
end
