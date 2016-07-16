class AssignmentQuestion < ActiveRecord::Base
	belongs_to :assignment
	belongs_to :question
end
