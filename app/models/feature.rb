class Feature < ApplicationRecord

	belongs_to :feature, polymorphic: true


end

