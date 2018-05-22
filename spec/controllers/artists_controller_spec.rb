require "rails_helper"

# command to run the test:
# rspec spec/controllers/artists_controller_spec.rb
RSpec.describe ArtistsController, :type => :controller do
	describe "GET index" do
    it 'it renders the index template successfully' do
    	get :index
      expect(response).to be_successful
    end
  end

end

