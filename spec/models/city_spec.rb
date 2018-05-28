require "rails_helper"

RSpec.describe City, :type => :model do

	# test associations
	it { should have_many(:events) }
  it { should have_many(:venues) }

  before(:each) do |example|
		@city = FactoryBot.build(:city)
	end

  # test validations
 	it "should be valid when built with all required attributes" do
    expect(@city).to be_valid
  end

  it "should not be valid when built without a name" do
  	@city.name = nil
    expect(@city).not_to be_valid
  end

  it "should not be valid when built without a state" do
  	@city.state = nil
    expect(@city).not_to be_valid
  end

  it "should not be valid when built without a zip" do
  	@city.zip = nil
    expect(@city).not_to be_valid
  end



end

