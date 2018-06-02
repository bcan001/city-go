class Venue < ApplicationRecord

	belongs_to :city
	has_many :events
	has_many :features, as: :feature

	has_many :links, as: :owner, dependent: :destroy
	

	validates :name, presence: true
	validates :description, presence: true
	validates :address, presence: true


	def upcoming_events(limit)
		events.upcoming_events(limit)
	end

	def past_events(limit)
		events.past_events(limit)
	end
	
end