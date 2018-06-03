require "rails_helper"

RSpec.describe "when the user clicks the rsvp button on an event", :type => :feature do

  before :each do
    @event = FactoryBot.create(:event)

  	visit events_path(@event)
    first('.rsvp-link').click
  end

  it "should redirect the user to the user sign in page if they are not currently signed in" do
    expect(page).to have_content 'Log in'
	end

  it "should go to new user_rsvp form if the user is logged in" do
    # expect(page).to have_content 'Log in'
  end



  it "should create a user_rsvp for the selected event if the user is signed in and then redirect the user to their profile page" do
    



  end


  
end