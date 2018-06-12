require "rails_helper"

RSpec.describe "when the user clicks the favorite button on an event", :type => :feature do

  before :each do |example|
    @link = FactoryBot.create(:link, owner_type: 'Artist', owner_id: 1, link_type: 'website', url: 'https://www.ekalimusic.com/')
    @artist = FactoryBot.create(:artist, links: [@link])
    @city = FactoryBot.create(:city)
    @venue = FactoryBot.create(:venue, city: @city)
    @event = FactoryBot.create(:event, artists: [@artist], venue: @venue)

    unless example.metadata[:skip_user_create]
      @user = FactoryBot.create(:user, first_name: 'Alexander', last_name: 'Ovechkin', email: 'ovierules@gmail.com', phone: '9061334567', username: 'ovierules', password: 'password')
      visit new_user_session_path
      within("#new_user") do
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
      end
      click_button 'Log In'
    end
  end

  it "should redirect the user to the user sign in page if they are not currently signed in when clicking on an event favorite", :skip_user_create do
    visit events_path(@event)
    first('.favorite-link').click
    expect(page).to have_content 'Log in'
	end

  it "should redirect the user to the user sign in page if they are not currently signed in when clicking on a venue favorite", :skip_user_create do
    visit venue_path(@venue)
    first('.favorite-link').click
    expect(page).to have_content 'Log in'
  end

  # favoriting events
  it "should create a favorite for the selected event if the user is logged in and they have not already favorited the event" do
    visit events_path(@event)
    first('.favorite-link').click
    expect(@user.user_favorites.count).to eq(1)
  end

  it "should unfavorite the selected event when clicking 'favorite' if the user is logged in and the have already favorited the event" do
    @user_favorite = FactoryBot.create(:user_favorite, user: @user, favorite_type: 'event', favorite_id: @event.id)
    visit events_path(@event)
    first('.favorite-link').click
    expect(@user.user_favorites.count).to eq(0)
  end

  # favoriting venues
  it "should create a favorite for the selected venue if the user is logged in and they have not already favorited the venue" do
    visit venue_path(@venue)
    first('.favorite-link').click
    expect(@user.user_favorites.count).to eq(1)
  end

  it "should unfavorite the selected venue when clicking 'favorite' if the user is logged in and the have already favorited the venue" do
    @user_favorite = FactoryBot.create(:user_favorite, user: @user, favorite_type: 'venue', favorite_id: @venue.id)
    visit venue_path(@venue)
    first('.favorite-link').click
    expect(@user.user_favorites.count).to eq(0)
  end






  #  it "should go to new user_rsvp form if the user is logged in" do
  #    expect(page).to have_content "RSVP"
  #  end

  #  it "should create a user_rsvp for the selected event when the new_user_rsvp form is submitted with correct attributes and then redirect the user to the event page" do

  #    within (".new_user_rsvp") do
  #      fill_in 'user_rsvp[first_name]', with: @user.first_name
  #      fill_in 'user_rsvp[last_name]', with: @user.last_name
  #      fill_in 'user_rsvp[email]', with: @user.email
  #    end
  #    click_button 'Submit RSVP'

  #    @user_rsvps = UserRsvp.all
  #    expect(@user_rsvps.count).to equal(1)
  #  end



end



