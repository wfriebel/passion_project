get "/login" do
	erb :"sessions/login"
end

post "/login" do
	user = authenticate(params[:email], params[:password])
	if user
		login(user)
		redirect "/courses"
	else
		@errors = "Either username is unknown or username does not match password."
		erb :"sessions/login"
	end
end

get "/logout" do
	logout
	redirect "/"
end

get "/register" do
	erb :"sessions/_register"
end

post "/register" do
	user = User.new(params[:user])
	if user.save
		login(user)
		redirect "/courses"
	else
		@errors = user.errors.full_messages
		erb :"sessions/_register"
	end
end