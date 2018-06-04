FactoryBot.define do
  factory :event do
  	event_date Time.now.in_time_zone("Central Time (US & Canada)").to_datetime.beginning_of_day
    title "Kygo Kid's In Love Tour at the United Center"
    description "Kygo comes to Chicago to play a concert at the United Center in Chicago!"
    city_id nil
    venue_id nil
    ticket_price '$39.99'
  end
end