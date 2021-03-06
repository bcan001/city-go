require "rails_helper"

RSpec.describe Event, :type => :model do

	# test associations
	it { should belong_to(:city) }
	it { should belong_to(:venue) }
	it { should have_many(:artists) }
  it { should have_many(:features) }
  it { should have_many(:user_rsvps) }


  before(:each) do |example|
		@event = FactoryBot.build(:event)
	end

  # test validations
 	it "should be valid when built with all required attributes" do
    expect(@event).to be_valid
  end

  it "should not be valid when built without a event_date" do
  	@event.event_date = nil
    expect(@event).not_to be_valid
  end

  it "should not be valid when built without a title" do
  	@event.title = nil
    expect(@event).not_to be_valid
  end

  it "should not be valid when built without a description" do
  	@event.description = nil
    expect(@event).not_to be_valid
  end

  # scope/class methods
  it "should return only events that are happening today in an array when scope 'todays_events' is called" do

  end

  it "should return only events that are happening tomorrow in an array when scope 'tomorrows_events' is called" do

  end

  it "should return all upcoming events in an array when scope 'upcoming_events' is called" do

  end

  it "should return all past events in an array when scope 'past_events' is called" do

  end



end










