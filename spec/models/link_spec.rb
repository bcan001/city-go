require "rails_helper"

RSpec.describe Link, :type => :model do

	# test associations
	it { should belong_to(:artist) }


  before(:each) do |example|
		@link = FactoryBot.build(:link)
	end

  # test validations
 	it "should be valid when built with all required attributes" do
    expect(@link).to be_valid
  end

  it "should not be valid when built without a link_type" do
  	@link.link_type = nil
    expect(@link).not_to be_valid
  end

  it "should not be valid when built without a url" do
  	@link.url = nil
    expect(@link).not_to be_valid
  end


end

