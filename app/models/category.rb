class Category < ActiveRecord::Base
	belongs_to :question
	belongs_to :content_tag
end
