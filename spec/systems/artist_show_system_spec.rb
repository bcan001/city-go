require "rails_helper"

RSpec.describe "the user clicks on an artist to display it's description'", :type => :feature do

  before :each do
  	@artist = FactoryBot.create(:artist)
  	@venue = FactoryBot.create(:venue)
  	@event = FactoryBot.create(:event, artists: [@artist], venue: @venue)

    visit event_path(@event)
    first('.artist-show').click
  end

  it "displays an artist that is playing at an event" do
    expect(page).to have_content @artist.name
	end

  it "displays the upcoming events that the artist is going to play immediately upon render" do
    expect(page).to have_content @event.title
  end

  it "shows past events when the past events dropdown is selected" do
    


  end

  
end
