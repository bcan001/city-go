require "rails_helper"

RSpec.describe Vote, :type => :model do

	# test associations
	it { should belong_to(:user) }


end

