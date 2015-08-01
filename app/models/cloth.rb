class Cloth < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :size , :color , :quantity
end
