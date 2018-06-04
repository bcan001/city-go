require "rails_helper"

RSpec.describe "the artist show", :type => :feature do

  before :each do
    @link = FactoryBot.create(:link, owner_type: 'Artist', owner_id: 1, link_type: 'website', url: 'https://www.ekalimusic.com/')
  	@artist = FactoryBot.create(:artist, links: [@link])
  	@venue = FactoryBot.create(:venue)
  	@event = FactoryBot.create(:event, artists: [@artist], venue: @venue, event_date: Time.now.to_datetime.end_of_day)

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
    # from dropdown
  end

  it "should show a link if the artist has a link" do
    expect(page).to have_content @link.url
  end

  
end
