require "rails_helper"

RSpec.describe "the user clicks on a venue to display it from the events show", :type => :feature do

  before :each do
  	@venue = FactoryBot.create(:venue, city_id: 1)
    @event = FactoryBot.create(:event, venue: @venue)
    @city = FactoryBot.create(:city, events: [@event])
  end

  it "brings the user to the venue show page" do
  	visit event_path(@event)
    first('.venue-show-link').click
    expect(page).to have_content @venue.name
	end

  
end
