require "rails_helper"

RSpec.describe "the user sign in process", :type => :feature do

	before :each do
    @user = FactoryBot.create(:user, first_name: 'Alexander', last_name: 'Ovechkin', email: 'ovierules@gmail.com', phone: '9061334567', username: 'ovierules', password: 'password')
  end

  it "signs the user in if they are a valid user in the database" do
  	visit '/users/sign_in'

  	within("#new_user") do
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
    end
    click_button 'Log In'
    expect(page).to have_content "Signed in successfully."
	end


end




