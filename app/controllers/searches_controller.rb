class SearchesController < ApplicationController
	include ApplicationHelper

	before_action :prepare_routes

	def index
		@search = params[:search]

	  @events = Event.all
	  @venues = Venue.all
	  @artists = Artist.all

	end


	def prepare_routes
		if (Rails.env == 'development') || (Rails.env == 'test')
			@route_prefix = 'http://localhost:3000'
		else
			# https://tranquil-shore-91433.herokuapp.com/
			@route_prefix = 'https://tranquil-shore-91433.herokuapp.com'
		end
	end


end



