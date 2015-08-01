class User < ActiveRecord::Base
	has_many :medicines , dependent: :destroy
	has_many :cloths , dependent: :destroy
end
