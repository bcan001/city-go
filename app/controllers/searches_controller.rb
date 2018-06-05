class SearchesController < ApplicationController
	include ApplicationHelper

	def index
		@search = params[:search]

	  @events = Event.all
	  @venues = Venue.all
	  @artists = Artist.all


	end

end



