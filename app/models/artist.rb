class Artist < ApplicationRecord

	has_many :links, dependent: :destroy

	# has_many :events
	has_many :event_relationships
  has_many :events, through: :event_relationships

	validates :name, presence: true
	validates :description, presence: true

	# scope :upcoming_events, -> (limit) { events.where(todays_events: true, tomorrows_events: true).limit(limit) }
	def upcoming_events(limit)
		events.upcoming_events(limit)
	end



end