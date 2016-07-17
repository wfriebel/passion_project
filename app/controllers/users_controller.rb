enable :sessions

post "/users" do
	user = User.new(params[:user])
	user.password = params[:password1]
	user.save
	session[:user_id] = user.id
	session[:has_courses] = false
	redirect "users/#{user.id}"
end

get "/users/new" do
	erb :"/users/new"
end

get "/users/:user_id" do
	@user = User.find(params[:user_id])
	erb :"users/show"
end

get "/users/:user_id/courses/:course_id" do
	session[:course_id] = params[:course_id]
	erb :"/courses/show"
end