require "rails_helper"

RSpec.describe "the user clicks on an event to display it from the events index page", :type => :feature do

  before :each do
    @event = FactoryBot.create(:event)
  end

  it "brings the user to the event show page" do
  	visit root_path
    first('.event-title').click
    expect(page).to have_content "Kygo Kid's In Love Tour at the United Center"
	end

  
end
