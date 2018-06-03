require "rails_helper"

RSpec.describe "when a logged in user views their profile page", :type => :feature do

  before :each do |example|
  	@user = FactoryBot.create(:user, first_name: 'Alexander', last_name: 'Ovechkin', email: 'ovierules@gmail.com', phone: '9061334567', username: 'ovierules', password: 'password')

  	visit '/users/sign_in'

  	within("#new_user") do
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
    end
    click_button 'Log In'

    visit user_profile_path(@user)
  end

  it "should have the username of the user diplayed on the page" do
  	# need to create banners for a user profile
    expect(page).to have_content @user.username
  end



end

