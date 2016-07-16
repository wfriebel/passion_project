class User < ActiveRecord::Base
	include BCrypt

	has_many :questions
	has_many :tags
	has_many :courses

	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end
end
