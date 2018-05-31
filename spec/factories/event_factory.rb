FactoryBot.define do
  factory :event do
  	event_date Time.now.to_datetime
    title "Kygo Kid's In Love Tour at the United Center"
    description "Kygo comes to Chicago to play a concert at the United Center in Chicago!"
    city_id nil
    venue_id nil
  end
end