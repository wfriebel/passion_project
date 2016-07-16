class Assignment < ActiveRecord::Base
	belongs_to :course

	has_many :assignment_questions
	has_many :questions, through: :assignment_questions
end
