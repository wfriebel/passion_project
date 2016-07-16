class ContentTag < ActiveRecord::Base
	has_many :categories
	has_many :questions, through: :categories
end
