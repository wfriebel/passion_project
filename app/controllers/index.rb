get "/" do
	erb :index
end

post "/login" do
	user_id = User.authenticate(params[:user])
	if user_id
		session[:user_id] = user_id
		session[:has_courses] = User.find(user_id).courses.count > 0 ? true : false
		redirect "/users/#{user_id}"
	else
		@error = "Please enter a valid email and password combination"
		erb :index
	end
end

get "/sign_out" do
	session[:user_id] = nil
	redirect "/"
end
