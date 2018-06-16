require "rails_helper"

RSpec.describe User, :type => :model do

	# test associations
	it { should have_many(:user_favorites) }
  it { should have_many(:votes) }
  it { should have_many(:user_rsvps) }

  before(:each) do |example|
		@user = FactoryBot.build(:user)
	end

  # test validations
 	it "should be valid when built with all required attributes" do
    expect(@user).to be_valid
  end

  it "should not be valid when built without a first_name" do
  	@user.first_name = nil
    expect(@user).not_to be_valid
  end

  it "should not be valid when built without a last_name" do
  	@user.last_name = nil
    expect(@user).not_to be_valid
  end

  it "should not be valid when built without an email" do
  	@user.email = nil
    expect(@user).not_to be_valid
  end

  it "should not be valid when built without a username" do
  	@user.username = nil
    expect(@user).not_to be_valid
  end

  it "should not be valid when built without a password" do
  	@user.password = nil
    expect(@user).not_to be_valid
  end


  # class methods
  it "should return all upcoming rsvp events" do
    @event = FactoryBot.create(:event)
    @rsvp = FactoryBot.create(:user_rsvp, user: @user, event: @event)
    expect(@user.upcoming_rsvp_events(10)).to eq([@event])
  end

  it "should return all past rsvp events" do
    @event = FactoryBot.create(:event, event_date: Time.now.in_time_zone("Central Time (US & Canada)").to_datetime - 10)
    @rsvp = FactoryBot.create(:user_rsvp, user: @user, event: @event)
    expect(@user.past_rsvp_events(10)).to eq([@event])
  end

  it "should return all favorite events" do
    @event = FactoryBot.create(:event)
    @user_favorite = FactoryBot.create(:user_favorite, user: @user, favorite_type: 'event', favorite_id: @event.id)
    expect(@user.favorite_events).to eq([@event])
  end

  it "should return all favorite venues" do
    @venue = FactoryBot.create(:venue)
    @user_favorite = FactoryBot.create(:user_favorite, user: @user, favorite_type: 'venue', favorite_id: @venue.id)
    expect(@user.favorite_venues).to eq([@venue])
  end
 

end

