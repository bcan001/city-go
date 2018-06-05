class SearchesController < ApplicationController

	def index
		@search = params[:search]

	  @events = Event.all
	  @venues = Venue.all
	  @artists = Artist.all


	end

end



