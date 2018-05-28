FactoryBot.define do
  factory :user_favorite do
  	user_id nil
    favorite_type 'event' # event, city, venue
    favorite_id nil
  end
end