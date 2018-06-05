class VenuesController < ApplicationController
	include ApplicationHelper

	def index
		
	end

	def show
		@venue = Venue.find(params[:id])
	end

	def upcoming_events
		@venue = Venue.find(params[:id])
		@events = @venue.upcoming_events(10)
		respond_to do |format|
		  format.js
		end
	end

	def past_events
		@venue = Venue.find(params[:id])
		@events = @venue.past_events(10)
		respond_to do |format|
		  format.js
		end
	end





end