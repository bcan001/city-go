class EventsController < ApplicationController

	def index

		# RSpotify.authenticate("", "")
		# artists = RSpotify::Artist.search('Arctic Monkeys')
		# binding.pry

		@events = Event.all

	end


end