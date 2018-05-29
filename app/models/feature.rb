class Feature < ApplicationRecord

	belongs_to :feature, polymorphic: true


	scope :featured_events, -> (limit) { where("features.feature_type == ?", "Event").limit(limit) }

	scope :featured_venues, -> (limit) { where("features.feature_type == ?", "Venue").limit(limit) }


end

