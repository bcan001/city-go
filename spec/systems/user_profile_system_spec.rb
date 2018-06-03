require "rails_helper"

RSpec.describe "when a logged in user views their profile page", :type => :feature do

  before :each do |example|
  	@user = FactoryBot.create(:user, first_name: 'Alexander', last_name: 'Ovechkin', email: 'ovierules@gmail.com', phone: '9061334567', username: 'ovierules', password: 'password')

  	unless example.metadata[:skip_user_sign_in]
	  	visit '/users/sign_in'

	  	within("#new_user") do
	      fill_in 'user_email', with: @user.email
	      fill_in 'user_password', with: @user.password
	    end
	    click_button 'Log In'

	    visit user_profile_path(@user)
	  end
  end

  it "should have the edit user button if the user is signed in to the application" do
  	# need to create banners for a user profile
    expect(page).to have_content 'Edit Profile'
  end

  it "should not display the edit user button if the user show is not for that user", :skip_user_sign_in do 
  	visit "/user_profiles/#{@user.id}"
  	expect(page).not_to have_content 'Edit Profile'
  end

  it "should not display upcoming rsvp events button if the user show is not for that user", :skip_user_sign_in do
  	visit "/user_profiles/#{@user.id}"
  	expect(page).not_to have_content 'UPCOMING RSVP EVENTS'
  end

end











