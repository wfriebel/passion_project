class Question < ActiveRecord::Base
	belongs_to :user

	has_many :categories
	has_many :tags, through: :categories

	has_many :assignment_questions
	has_many :assignments, through: :assignment_questions
end
