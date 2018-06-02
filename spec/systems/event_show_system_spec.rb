require "rails_helper"

RSpec.describe "the user clicks on an event to display it from the events index page", :type => :feature do

  before :each do
  	@venue = FactoryBot.create(:venue)
    @event = FactoryBot.create(:event, venue: @venue)
  end

  it "brings the user to the event show page" do
  	visit root_path
    first('.event-title').click
    expect(page).to have_content @event.title
	end

  
end