class Organization < ActiveRecord::Base

  has_attached_file :photo, :styles => { :medium => "200x200>"}, :default_url =>   "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

   has_attached_file :document, styles: {thumbnail: "60x60#"} 
  validates_attachment :document, content_type: { content_type: ["application/pdf",/\Aimage\/.*\Z/] }
end
