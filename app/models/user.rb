class User < ActiveRecord::Base
	include BCrypt

	has_many :questions
	has_many :tags
	has_many :courses

	validates :first_name, :last_name, :password_hash, presence: true
	validates :email, presence: true, uniqueness: true

	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end

	def last_initial
		last_name[0]
	end
end
