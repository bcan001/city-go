class EventsController < ApplicationController

	def index

		# RSpotify.authenticate("", "")
		# artists = RSpotify::Artist.search('Arctic Monkeys')
		# binding.pry

		@events = Event.all

		
		# @events = @events.select {|event| event.event_date.today == true}
		# binding.pry
		# @featured_events =

	end


end