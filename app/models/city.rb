class City < ApplicationRecord

	has_many :events
	has_many :venues

	
end