require "rails_helper"

RSpec.describe "when a user tries to upvote an event", :type => :feature do

  before :each do |example|
  	@user = FactoryBot.create(:user, first_name: 'Alexander', last_name: 'Ovechkin', email: 'ovierules@gmail.com', phone: '9061334567', username: 'ovierules', password: 'password')

    @venue = FactoryBot.create(:venue)
    @event = FactoryBot.create(:event, venue: @venue)

  	unless example.metadata[:skip_user_sign_in]
	  	visit '/users/sign_in'

	  	within("#new_user") do
	      fill_in 'user_email', with: @user.email
	      fill_in 'user_password', with: @user.password
	    end
	    click_button 'Log In'

	    visit root_path
	  end

  end

  it "should redirect user to log in if they click upvote on an event and are not logged in", :skip_user_sign_in do
    visit root_path
    first('.upvote-event').click

    expect(page).to have_content 'Log in'
  end


  it "should create a vote for that event for the user if the user is logged in and clicks to upvote an event" do
    visit root_path
    first('.upvote-event').click

    @votes = Vote.all
    expect(@votes.count).to equal(1)
  end

  it "should not create a vote for that event for the user if the user is logged in and clicks to upvote an event but has already upvoted the event" do
    @upvote = FactoryBot.create(:vote, user_id: @user.id, vote_type: 'event', vote_id: @event.id)

    visit root_path
    first('.upvote-event').click

    @votes = Vote.all
    expect(@votes.count).to equal(1)
  end



end










