get "/courses" do
	if !session[:user_id]
		redirect "/"
	else
		@courses = current_user.courses
		erb :"courses/index"
	end
end

post "/courses" do
	course = Course.new(name: params[:name])
	if course.save
		current_user.courses << course
		redirect "/courses"
	else

	end
end

get "/courses/new" do
	erb :"/courses/new"
end

get "/courses/:id" do
	@course = Course.find(params[:id])
	erb :"courses/show"
end

delete "/courses/:id" do
	Course.find(params[:id]).destroy
	redirect "/courses"
end
