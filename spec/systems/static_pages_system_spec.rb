require "rails_helper"

RSpec.describe "when a user navigates to one of the static pages on the footer of the site", :type => :feature do

  # before :each do
  # 	visit events_path

  #   @search = 'ekali'
  # 	within(".search-form") do
  #     fill_in 'search', with: @search
  #   end
  #   click_button 'Search'
  # end


  it "should show correct header content when visiting 'featured events'" do
    visit featured_path
    expect(page).to have_content 'FEATURED EVENTS!'
  end

  it "should show correct header content when visiting 'latest from city-go' path" do
    visit latest_path
    expect(page).to have_content 'LATEST FROM CITY-GO!'
  end

  it "should show correct header content when visiting 'find us'" do
    visit find_us_path
    expect(page).to have_content 'FIND US!'
  end



end