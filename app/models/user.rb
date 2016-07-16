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

	#Parameters: Takes a hash of user_info containing email and password
	#Return: If authenticated, returns user_id, else returns nil
	def self.authenticate(user_info)
		#Check if the e-mail matches a registered user
		emails = User.pluck(:email)
		valid_email = emails.include?(user_info[:email])

		user_id = ""

		#Check if the entered password matches the users email
		valid_password = false
		if valid_email
			user = User.find_by(email: "#{user_info[:email]}")
			if user.password == user_info[:password]
				valid_password = true 
				user_id = user.id
			end
		end

		if valid_email && valid_password
			return user.id
		else
			return nil
		end
	end
end
