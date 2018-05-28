class UserFavorite < ApplicationRecord

  belongs_to :user

	validates :favorite_type, presence: true


end