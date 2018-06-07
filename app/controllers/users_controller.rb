class UsersController < ApplicationController

	before_action :set_user, only: [:show,:upcoming_rsvp_events,:past_rsvp_events]

	def show
		@events = @user.upcoming_rsvp_events(10)
	end

	def upcoming_rsvp_events
		@events = @user.upcoming_rsvp_events(10)
		respond_to do |format|
		  format.js
		end
	end

	def past_rsvp_events
		@events = @user.past_rsvp_events(10)
		respond_to do |format|
		  format.js
		end
	end

	# def edit
	# end

	# def update
	# end

	# def destroy
	# end

	def set_user
		@user = User.find(params[:id])
	end

end