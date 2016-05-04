module StudentsHelper

	def checkadmin
		@user = User.find(current_user).roles
     if @user == "Admin"
       return @user
     else
     	return false
     end
	end
end
