require "rails_helper"

RSpec.describe "the venue show", :type => :feature do

  before :each do
    @link = FactoryBot.create(:link, owner_type: 'Venue', owner_id: 1, link_type: 'website', url: 'https://www.themidchicago.com/')
  	@venue = FactoryBot.create(:venue, city_id: 1, links: [@link])
    @event = FactoryBot.create(:event, venue: @venue, event_date: Time.now.to_datetime.end_of_day)
    @city = FactoryBot.create(:city, events: [@event])

    visit event_path(@event)
    first('.venue-show-link').click
  end

  it "link works and brings the user to the venue show page" do
    expect(page).to have_content @venue.name
	end

  it "displays events that will happen today immediately upon render" do
    expect(page).to have_content @event.title
  end

  it "shows past events when the past events dropdown is selected" do
    # from dropdown
  end

  it "should show a link if the venue has a link" do
    expect(page).to have_content @link.url
  end


end
