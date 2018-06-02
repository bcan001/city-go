class Event < ApplicationRecord

	belongs_to :city
	belongs_to :venue

	# belongs_to :artist
	# NEEDS TO BECOME A POSSIBLE EVENT RELATIONSHIP JOIN TABLE WITH ARTISTS
	has_many :event_relationships
  has_many :artists, through: :event_relationships
	

	has_many :features, as: :feature
	
	validates :event_date, presence: true
	validates :title, presence: true
	validates :description, presence: true

	scope :todays_events, -> (limit) { where("(events.event_date >= ?) AND (events.event_date < ?)", Date.today, Date.today + 1).limit(limit) }

	scope :tomorrows_events, -> (limit) { where("(events.event_date >= ?) AND (events.event_date < ?)", Date.today + 1, Date.today + 2).limit(limit) }

	scope :upcoming_events, -> (limit) { where("events.event_date >= ?", Date.today).limit(limit) }

end









