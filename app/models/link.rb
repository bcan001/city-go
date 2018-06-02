class Link < ApplicationRecord

	# spotify, website, twitter, facebook, youtube
	# belongs_to :artist

	belongs_to :owner, polymorphic: true


	validates :link_type, presence: true
	validates :url, presence: true

end

