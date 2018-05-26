class Event < ApplicationRecord

	belongs_to :city
	belongs_to :venue
	belongs_to :artist
	
	validates :event_date, presence: true
	validates :title, presence: true
	validates :description, presence: true
end