class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Authentication

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_one :role , dependent: :destroy
	has_many :attendence , dependent: :destroy

	def check_user_role(current_user)
		user_is_admin?(current_user)
	end	
	
end
