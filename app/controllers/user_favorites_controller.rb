class UserFavoritesController < ApplicationController

	def create
		if !current_user
			redirect_to new_user_session_path
		else
			@event = Event.find(params[:event_id]) if params[:event_id]
			@venue = Venue.find(params[:venue_id]) if params[:venue_id]

			if @event

			elsif @venue

			end
		end
	end

	def update


	end

end