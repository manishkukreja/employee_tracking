module Authentication
	module ClassMethods
		
	end
	
	module InstanceMethods
		
	end
	
	def user_is_admin?(user)
		if UserRole.where('user_id', user).select('role_id').first.role_id.eql?(1)
			return true
		else
			  	flash[:notice] = "You need to be ADMIN before accessing this page"
				redirect_to new_user_session_path
			  end	
	end	

	
	def user_logged_in?
		if current_user
			return current_user
		else	
			flash[:notice] = "You need to signin before accessing this page"
			redirect_to new_user_session_path
  		end
	end
		  
		





end