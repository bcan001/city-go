require "rails_helper"

RSpec.describe Feature, :type => :model do

	# # test associations
	it { should belong_to(:feature) }


end