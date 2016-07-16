enable :sessions

post "/users" do
	user_id = User.authenticate(params[:user])
	if user_id
		session[:id] = user_id
		redirect "/users/#{user_id}"
	else
		@error = "Please enter a valid email and password combination"
		erb :index
	end
end

get "/users/:id" do
	@user = User.find(params[:id])
	erb :"users/show"
end