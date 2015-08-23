class Medicine < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :name , :exp_date , :concentration , :quantity
end
