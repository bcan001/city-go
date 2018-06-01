require "rails_helper"

RSpec.describe "the user clicks on an artist to display it's description'", :type => :feature do

  before :each do
  	@artist = FactoryBot.create(:artist)
  	@venue = FactoryBot.create(:venue)
  	@event = FactoryBot.create(:event, artists: [@artist], venue: @venue)
  end

  it "displays an artist that is playing at an event" do
  	visit event_path(@event)
    first('.artist-show').click
    expect(page).to have_content @artist.name
	end

  
end
