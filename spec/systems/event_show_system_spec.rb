require "rails_helper"

RSpec.describe "the event show", :type => :feature do

  before :each do
  	@venue = FactoryBot.create(:venue)
    @event = FactoryBot.create(:event, venue: @venue)
  end

  it "link brings the user to the event show page" do
  	visit root_path
    first('.event-title').click
    expect(page).to have_content @event.title
	end

	it "should show the correct amount of people who have rsvp'd" do
		@user = FactoryBot.create(:user)
		@user_rsvp = FactoryBot.create(:user_rsvp, user: @user, event: @event)
		visit root_path
		expect(page).to have_content "1 RSVP's"
	end

  
end
