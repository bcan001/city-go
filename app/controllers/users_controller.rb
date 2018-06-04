class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@events = @user.upcoming_rsvp_events(10)
	end

	def upcoming_rsvp_events
		@user = User.find(params[:id])
		@events = @user.upcoming_rsvp_events(10)
		respond_to do |format|
		  format.js
		end
	end

	def past_rsvp_events
		@user = User.find(params[:id])
		@events = @user.past_rsvp_events(10)
		respond_to do |format|
		  format.js
		end
	end


	def edit


	end

	def update


	end

	def destroy

	end

end