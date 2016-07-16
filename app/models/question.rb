class Question < ActiveRecord::Base
	has_many :categories
	has_many :content_tags, through: :categories
	belongs_to :user
end
