require "rails_helper"

RSpec.describe Venue, :type => :model do

	# test associations
	it { should have_many(:events) }
  it { should belong_to(:city) }
  it { should have_many(:features) }

  before(:each) do |example|
		@venue = FactoryBot.build(:venue)
	end

  # test validations
 	it "should be valid when built with all required attributes" do
    expect(@venue).to be_valid
  end

  it "should not be valid when built without a name" do
  	@venue.name = nil
    expect(@venue).not_to be_valid
  end

  it "should not be valid when built without a description" do
  	@venue.description = nil
    expect(@venue).not_to be_valid
  end

  it "should not be valid when built without a address" do
  	@venue.address = nil
    expect(@venue).not_to be_valid
  end


end

