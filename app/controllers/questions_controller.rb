get "/assignments/:id/questions" do
	@assignment = Assignment.find(params[:id])
	erb :"questions/index"
end

get "/assignments/:id/questions/find_by_tag" do
	@assignment = Assignment.find(params[:id])
	@tag = Tag.find_by(name: params[:tag])
	@questions = @tag.questions
	erb :"questions/show_by_tag"
end

post "/assignments/:assignment_id/questions/:question_id" do
	assignment = Assignment.find(params[:assignment_id])
	assignment.questions << Question.find(params[:question_id])
	redirect "/assignments/#{assignment.id}"
end

get "/assignments/:id/questions/new" do
	@assignment = Assignment.find(params[:id])
	erb :"questions/new"
end


get "/questions/:id" do
	@question = Question.find(params[:id])
	erb :"questions/show" 
end

post "/questions" do
	question = Question.new(
					content: params[:content],
					rigor: params[:rigor]
				)
	if question.save
		current_user.questions << question
		assignment = Assignment.find(params[:assignment_id])
		assignment.questions << question
		if params[:tag1]
			tag1 = Tag.find_or_create_by(name: params[:tag1].capitalize) 
			question.tags << tag1
			current_user.tags << tag1
		end
		if params[:tag2]
			tag2 = Tag.find_or_create_by(name: params[:tag2].capitalize) 
			question.tags << tag2
			current_user.tags << tag2
		end
		if params[:tag3]
			tag3 = Tag.find_or_create_by(name: params[:tag3].capitalize) 
			question.tags << tag3
			current_user.tags << tag3
		end
	end
	redirect "/assignments/#{assignment.id}"
end
