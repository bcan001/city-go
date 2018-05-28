class Link < ApplicationRecord

	# spotify, website, twitter, facebook, youtube
	belongs_to :artist

	validates :link_type, presence: true
	validates :url, presence: true

end

