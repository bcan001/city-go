class EventsController < ApplicationController
	include ApplicationHelper

	before_action :set_all_events, only: [:index,:tomorrows_events]

	def index
		# RSpotify.authenticate("", "")
		# artists = RSpotify::Artist.search('Arctic Monkeys')

		# set_all_events
	end

	def show
		# @event = Event.joins(:artist,:venue).find(params[:id])
		@event = Event.find(params[:id])
	end


	def tomorrows_events
		# set_all_events
	end


	def set_all_events
		@events = Event.todays_events(20)
		@featured_events = Feature.featured_events(5)
		@featured_venues = Feature.featured_venues(5)
	end

end







