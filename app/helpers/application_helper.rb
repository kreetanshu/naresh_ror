module ApplicationHelper

	def loginuser
      User.find(current_user).email
	end
end
