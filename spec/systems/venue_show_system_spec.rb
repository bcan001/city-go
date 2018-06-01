require "rails_helper"

RSpec.describe "the user clicks on a venue to display it from the events show", :type => :feature do

  before :each do
  	@venue = FactoryBot.create(:venue)
    @event = FactoryBot.create(:event, venue: @venue)
  end

  it "brings the user to the venue show page" do
  	visit event_path(@event)
    first('.venue-show-link').click
    expect(page).to have_content @venue.name
	end

  
end
