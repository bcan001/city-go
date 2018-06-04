class Event < ApplicationRecord

	belongs_to :city
	belongs_to :venue

	# belongs_to :artist
	# NEEDS TO BECOME A POSSIBLE EVENT RELATIONSHIP JOIN TABLE WITH ARTISTS
	has_many :event_relationships
  has_many :artists, through: :event_relationships

  has_many :user_rsvps, dependent: :destroy
	

	has_many :features, as: :feature
	
	validates :event_date, presence: true
	validates :title, presence: true
	validates :description, presence: true

	scope :todays_events, -> (limit) { where("(events.event_date >= ?) AND (events.event_date < ?)", Time.now.in_time_zone("Central Time (US & Canada)").to_datetime.beginning_of_day, Time.now.in_time_zone("Central Time (US & Canada)").to_datetime.end_of_day).limit(limit) }

	scope :tomorrows_events, -> (limit) { where("(events.event_date >= ?) AND (events.event_date < ?)", Time.now.in_time_zone("Central Time (US & Canada)").to_datetime.end_of_day, (Time.now.in_time_zone("Central Time (US & Canada)").to_datetime + 1).end_of_day).limit(limit) }

	scope :upcoming_events, -> (limit) { where("events.event_date >= ?", Time.now.in_time_zone("Central Time (US & Canada)").to_datetime).limit(limit) }

	scope :past_events, -> (limit) { where("events.event_date < ?", Time.now.in_time_zone("Central Time (US & Canada)").to_datetime).limit(limit) }

end









