class UsersController < ApplicationController

	before_action :set_user, only: [:show,:upcoming_rsvp_events,:past_rsvp_events]

	def index
		if params[:user_type] == 'all'
			# show all users signed up
			@title = 'All Users'

		elsif params[:user_type] == 'friends'
			# show all of the friends of a user
			@title = 'My Friends'


		elsif params[:user_type] == 'event_rsvps'
			# show all the users that have rsvp'd for an event
			@title = "All RSVP's"
			
			

		end
	end

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