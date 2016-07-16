class Tag < ActiveRecord::Base
	belongs_to :user

	has_many :categories
	has_many :questions, through: :categories
end
