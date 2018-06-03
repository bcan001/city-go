require "rails_helper"

RSpec.describe "when the user clicks the rsvp button on an event", :type => :feature do

  before :each do |example|
    @link = FactoryBot.create(:link, owner_type: 'Artist', owner_id: 1, link_type: 'website', url: 'https://www.ekalimusic.com/')
    @artist = FactoryBot.create(:artist, links: [@link])
    @venue = FactoryBot.create(:venue)
    @event = FactoryBot.create(:event, artists: [@artist], venue: @venue)

  	visit events_path(@event)
    first('.rsvp-link').click

    unless example.metadata[:skip_user_create]
      @user = FactoryBot.create(:user, first_name: 'Alexander', last_name: 'Ovechkin', email: 'ovierules@gmail.com', phone: '9061334567', username: 'ovierules', password: 'password')
      within("#new_user") do
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
      end
      click_button 'Log In'
      visit events_path(@event)
      first('.rsvp-link').click
    end
  end

  it "should redirect the user to the user sign in page if they are not currently signed in", :skip_user_create do
    expect(page).to have_content 'Log in'
	end

  it "should go to new user_rsvp form if the user is logged in" do
    expect(page).to have_content "RSVP"
  end

  it "should create a user_rsvp for the selected event when the new_user_rsvp form is submitted with correct attributes and then redirect the user to the event page" do

    within (".new_user_rsvp") do
      fill_in 'user_rsvp[first_name]', with: @user.first_name
      fill_in 'user_rsvp[last_name]', with: @user.last_name
      fill_in 'user_rsvp[email]', with: @user.email
    end
    click_button 'Submit RSVP'

    @user_rsvps = UserRsvp.all
    expect(@user_rsvps.count).to equal(1)
  end


  
end








