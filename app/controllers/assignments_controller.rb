post "/courses/:id/assignments" do
	assignment = Assignment.new(name: params[:name])
	if assignment.save
		course = Course.find(params[:id])
		course.assignments << assignment
		redirect "/assignments/#{assignment.id}"
	else
		redirect "/courses/#{params[:id]}/assignments/new"
	end
end

get "/courses/:id/assignments/new" do
	@course = Course.find(params[:id])
	erb :"assignments/new"
end

get "/assignments/:id" do
	@assignment = Assignment.find(params[:id])
	erb :"assignments/show"
end