require "rails_helper"

RSpec.describe "when user enters something in the search bar", :type => :feature do

  before :each do
  	visit events_path

    @search = 'ekali'
  	within(".search-form") do
      fill_in 'search', with: @search
    end
    click_button 'Search'
  end

  it "should display what the user searched for on the search index page" do
    expect(page).to have_content @search
	end




  
end