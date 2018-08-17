class StaticsController < ApplicationController
	include StaticsHelper

	def latest
		@title = "LATEST FROM CITY-GO!"
	end

	def featured
		@title = "FEATURED EVENTS!"
	end

	def find_us
		@title = "FIND US!"
	end






end


