class Organization < ActiveRecord::Base

	 has_attached_file :photo, :styles => { :medium => "200x200>"}, :default_url =>   "/public/system/oragnizations/photos/000/:id/:style/:basename.:extension"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
