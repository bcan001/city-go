class EventsController < ApplicationController
	include ApplicationHelper
	include ArtistsHelper
	include EventsHelper

	before_action :set_featured_events_and_venues, only: [:index,:tomorrows_events]

	def index
		# fetch_events('Ekali','today')

		@events = todays_events
		@events = @events.page(params[:page]).per(10)
	end

	def show
		# @event = Event.joins(:artist,:venue).find(params[:id])
		@event = Event.find(params[:id])
	end


	def tomorrows_events
		@events = Event.tomorrows_events
		@events = @events.page(params[:page]).per(10)
	end

	def todays_events
		Event.todays_events
	end

	def set_featured_events_and_venues
		@featured_events = Feature.featured_events(5)
		@featured_venues = Feature.featured_venues(5)
	end

end





