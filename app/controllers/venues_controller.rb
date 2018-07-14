class VenuesController < ApplicationController
	include ApplicationHelper
	include VenuesHelper

	before_action :set_venue, only: [:show,:upcoming_events,:past_events]

	def index
		
	end

	def show
		
	end

	def upcoming_events
		@events = @venue.upcoming_events(10)
		respond_to do |format|
		  format.js
		end
	end

	def past_events
		@events = @venue.past_events(10)
		respond_to do |format|
		  format.js
		end
	end


	def set_venue
		@venue = Venue.find(params[:id])
	end


end