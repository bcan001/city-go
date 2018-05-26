class Artist < ApplicationRecord

	has_many :events
	has_many :links, dependent: :destroy

	validates :name, presence: true
	validates :description, presence: true

end