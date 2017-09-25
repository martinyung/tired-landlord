class UsersController < ApplicationController
	include Response
	include ExceptionHandler
	
	def create
		@user = User.create!(user_params)
		json_response(@user, :created)
	end

	private

	def user_params
		params.permit(:email, :password_digest)
	end
end
