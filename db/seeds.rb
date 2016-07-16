users = User.all
users.each {|user| users.destroy}

questions = Question.all
questions.each {|question| question.destroy}

content_tags = ContentTag.all
content_tags.each {|content_tag| content_tag.destroy}

categories = Category.all
categories.each {|category| category.destroy}

user = User.create(
	first_name: "Will", 
	last_name: "Friebel", 
	email: "will@will.com", 
	password: "123"
	)

question1 = Question.create(content: "First quesion")
question2 = Question.create(content: "Second quesion")
question3 = Question.create(content: "Third quesion")

user.questions << question1
user.questions << question2
user.questions << question3

factoring = ContentTag.create(name: "factoring")
trig = ContentTag.create(name: "trig")
polynomial = ContentTag.create(name: "polynomial")

question1.content_tags << factoring
question1.content_tags << trig

question2.content_tags << trig
question2.content_tags << polynomial

question3.content_tags << polynomial
question3.content_tags << factoring


