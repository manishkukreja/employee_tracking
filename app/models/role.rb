
class Role < ActiveRecord::Base
	include Authentication
	belongs_to :user
end
