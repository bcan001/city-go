class Artist < ApplicationRecord

	has_many :events
	has_many :links

end