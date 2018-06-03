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


end

