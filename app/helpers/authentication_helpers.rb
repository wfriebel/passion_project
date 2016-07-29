helpers do
	def login(user)
		session[:user_id] = user.id
	end

	def logout
		session[:user_id] = nil
	end

	def current_user
		if session[:user_id]
			@user ||= User.find(session[:user_id])
		else
			nil
		end
	end

	def authenticate(input_email, input_password)
		user = User.find_by(email: input_email)
		if user
			password_match = user.password == input_password ? true : false
		end
		if user && password_match
			user
		else
			nil
		end
	end
end