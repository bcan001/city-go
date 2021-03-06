class Artist < ApplicationRecord

	has_many :links, as: :owner, dependent: :destroy


	# has_many :events
	has_many :event_relationships
  has_many :events, through: :event_relationships

	validates :name, presence: true
	validates :description, presence: true

	# scope :upcoming_events, -> (limit) { events.where(todays_events: true, tomorrows_events: true).limit(limit) }
	def upcoming_events(limit)
		events.upcoming_events(limit)
	end

	def past_events(limit)
		events.past_events(limit)
	end

	def upvote_count
		Vote.where(vote_type: 'artist', vote_id: self.id).count
	end

	def favorite_count
		UserFavorite.where(favorite_type: 'artist', favorite_id: self.id).count
	end
	


end