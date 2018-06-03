require "rails_helper"

RSpec.describe UserRsvp, :type => :model do

	# # test associations
	it { should belong_to(:user) }
  it { should belong_to(:event) }



  before(:each) do |example|
  	@user = FactoryBot.build(:user)
  	@event = FactoryBot.build(:event)
		@user_rsvp = FactoryBot.build(:user_rsvp, user: @user, event: @event)
	end

  # test validations
 	it "should be valid when built with all required attributes" do
    expect(@user_rsvp).to be_valid
  end

  # it "should not be valid when built without a user_id" do
  # 	@user_rsvp.user_id = nil
  #   expect(@user_favorite).not_to be_valid
  # end



end
