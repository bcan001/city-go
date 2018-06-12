class UserFavoritesController < ApplicationController

	def create
		if !current_user
			redirect_to new_user_session_path
		else
			@event = Event.find(params[:event_id]) if params[:event_id]
			@venue = Venue.find(params[:venue_id]) if params[:venue_id]

			if @event
				if current_user.user_favorites.find_by(favorite_type: 'event', favorite_id: @event.id)
					current_user.user_favorites.find_by(favorite_type: 'event', favorite_id: @event.id).destroy
					redirect_to event_path(@event), notice: "You've unfavorited this event"
				else
					user_favorite = current_user.user_favorites.build(favorite_type: 'event', favorite_id: @event.id)
					user_favorite.save
					redirect_to event_path(@event), notice: "You've succesfully favorited this event"
				end
			elsif @venue
				if current_user.user_favorites.find_by(favorite_type: 'venue', favorite_id: @venue.id)
					current_user.user_favorites.find_by(favorite_type: 'venue', favorite_id: @venue.id).destroy
					redirect_to venue_path(@venue), notice: "You've unfavorited this venue"
				else
					user_favorite = current_user.user_favorites.build(favorite_type: 'venue', favorite_id: @venue.id)
					user_favorite.save
					redirect_to venue_path(@venue), notice: "You've succesfully favorited this venue"
				end
			end
		end
	end

	def update


	end

end