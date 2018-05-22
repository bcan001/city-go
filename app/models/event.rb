class Event < ApplicationRecord

	belongs_to :city
	belongs_to :venue
	belongs_to :artist
	

end