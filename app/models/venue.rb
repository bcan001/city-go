class Venue < ApplicationRecord

	belongs_to :city
	has_many :events
	has_many :features, as: :feature


	validates :name, presence: true
	validates :description, presence: true
	validates :address, presence: true



end