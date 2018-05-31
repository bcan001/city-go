require "rails_helper"

RSpec.describe "the user clicks on a featured venue from the dropdown and it goes to the show page of that venue", :type => :feature do

  before :each do
    @venue = FactoryBot.create(:venue)
    @event = FactoryBot.create(:event, venue: @venue)
    @featured_venues = [@venue]
  end

  it "brings the user to the venue show page" do
  	visit root_path
    # first('a.dropdown-item.featured-venue').click
    # select "option_name_here", :from => "organizationSelect"
    find('.featured-venues').click
    # binding.pry
    # expect(page).to have_content @venue.name

	end

  
end