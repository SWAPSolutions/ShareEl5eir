class Member < ActiveRecord::Base
	has_many :medicines , dependent: :destroy
	has_many :cloths , dependent: :destroy

		attr_accessor :photo_file_name

	  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url =>   "/assets/users/:id/:style/:basename.:extension"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
