helpers do
	def logged_in?
		session[:user_id].present?
	end
end