class EventsController < ApplicationController
	include ApplicationHelper
	include ArtistsHelper

	before_action :set_featured_events_and_venues, only: [:index,:tomorrows_events]

	def index
		# RSpotify.authenticate("", "")
		# artists = RSpotify::Artist.search('Arctic Monkeys')

		# fetch_spotify_image('Ekali')


		todays_events
	end

	def show
		# @event = Event.joins(:artist,:venue).find(params[:id])
		@event = Event.find(params[:id])
	end


	def tomorrows_events
		@events = Event.tomorrows_events(20)
	end

	def todays_events
		@events = Event.todays_events(20)
	end

	def set_featured_events_and_venues
		@featured_events = Feature.featured_events(5)
		@featured_venues = Feature.featured_venues(5)
	end

end





