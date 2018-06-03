class UserRsvpsController < ApplicationController

	def new
		if !current_user # there is no signed in user
			redirect_to new_user_session_path
		end
	end

	def create
		
	end

	def destroy


	end



end