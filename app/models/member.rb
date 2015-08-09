class Member < ActiveRecord::Base
	has_many :medicines , dependent: :destroy
	has_many :cloths , dependent: :destroy
  has_attached_file :photo, :styles => { :medium => "200x200>"}, :default_url =>   "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end

# /public/system/members/photos/000/:id/:style/:basename.:extension
