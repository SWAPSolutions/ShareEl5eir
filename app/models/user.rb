class User < ActiveRecord::Base
	has_many :medicines , dependent: :destroy
	has_many :clothes , dependent: :destroy
end
