class City < ApplicationRecord

	has_many :events, dependent: :destroy
	has_many :venues, dependent: :destroy


	validates :name, presence: true
	validates :state, presence: true
	validates :zip, presence: true

	
	
end