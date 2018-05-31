class Artist < ApplicationRecord

	has_many :links, dependent: :destroy

	# has_many :events
	has_many :event_relationships
  has_many :events, through: :event_relationships

	validates :name, presence: true
	validates :description, presence: true

end