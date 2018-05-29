class EventsController < ApplicationController

	def index

		# RSpotify.authenticate("", "")
		# artists = RSpotify::Artist.search('Arctic Monkeys')

		@events = Event.todays_events(10)
		@featured_events = Feature.featured_events(5)
		@featured_venues = Feature.featured_venues(5)

		binding.pry

	end


end