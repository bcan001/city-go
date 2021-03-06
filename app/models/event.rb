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

	scope :todays_events, -> () { where("(events.event_date >= ?) AND (events.event_date < ?)", Time.now.in_time_zone("Central Time (US & Canada)").to_datetime.beginning_of_day, Time.now.in_time_zone("Central Time (US & Canada)").to_datetime.end_of_day) }

	scope :tomorrows_events, -> () { where("(events.event_date >= ?) AND (events.event_date < ?)", Time.now.in_time_zone("Central Time (US & Canada)").to_datetime.end_of_day, (Time.now.in_time_zone("Central Time (US & Canada)").to_datetime + 1).end_of_day) }

	scope :upcoming_events, -> (limit) { where("events.event_date >= ?", Time.now.in_time_zone("Central Time (US & Canada)").to_datetime).limit(limit) }

	scope :past_events, -> (limit) { where("events.event_date < ?", Time.now.in_time_zone("Central Time (US & Canada)").to_datetime).limit(limit) }

	def rsvp_count
		user_rsvps.count
	end

	def upvote_count
		Vote.where(vote_type: 'event', vote_id: self.id).count
	end

	def favorite_count
		UserFavorite.where(favorite_type: 'event', favorite_id: self.id).count
	end


end









