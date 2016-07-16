users = User.all
users.each {|user| user.destroy}

questions = Question.all
questions.each {|question| question.destroy}

tags = Tag.all
tags.each {|tag| tag.destroy}

categories = Category.all
categories.each {|category| category.destroy}

courses = Course.all
courses.each {|course| course.destroy}

assignments = Assignment.all
assignments.each {|assignment| assignment.destroy}

user = User.new(
	first_name: "Will", 
	last_name: "Friebel", 
	email: "will@will.com", 
	)
user.password = "123"
user.save!

question1 = Question.create(content: "First quesion")
question2 = Question.create(content: "Second quesion")
question3 = Question.create(content: "Third quesion")

user.questions << question1
user.questions << question2
user.questions << question3

algebra = Course.create(name: "algebra")
geometry = Course.create(name: "geometry")

user.courses << algebra
user.courses << geometry

assignment1 = Assignment.create(name: "assignment1")
assignment2 = Assignment.create(name: "assignment2")
assignment3 = Assignment.create(name: "assignment3")
assignment4 = Assignment.create(name: "assignment4")

assignment1.questions << question1
assignment1.questions << question2
assignment2.questions << question2
assignment2.questions << question3
assignment3.questions << question3
assignment3.questions << question1
assignment4.questions << question1
assignment4.questions << question2

algebra.assignments << assignment1
algebra.assignments << assignment2
geometry.assignments << assignment3
geometry.assignments << assignment4


factoring = Tag.create(name: "factoring")
trig = Tag.create(name: "trig")
polynomial = Tag.create(name: "polynomial")

user.tags << factoring
user.tags << trig
user.tags << polynomial

question1.tags << factoring
question1.tags << trig
question2.tags << trig
question2.tags << polynomial
question3.tags << polynomial
question3.tags << factoring

