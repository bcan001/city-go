class EventsController < ApplicationController
	include ApplicationHelper

	def index
		# RSpotify.authenticate("", "")
		# artists = RSpotify::Artist.search('Arctic Monkeys')

		@events = Event.todays_events(20)
		@featured_events = Feature.featured_events(5)
		@featured_venues = Feature.featured_venues(5)

	end

	def show
		# @event = Event.joins(:artist,:venue).find(params[:id])
		@event = Event.find(params[:id])
	end


	def tomorrows_events
		@events = Event.tomorrows_events(20)
		@featured_events = Feature.featured_events(5)
		@featured_venues = Feature.featured_venues(5)
	end

end







