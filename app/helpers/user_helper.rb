#module UserHelper
module UserHelper
	def users_list
		User.where.not(id: current_user.id).map { |s| [s.email, s.id] }
	end
end
