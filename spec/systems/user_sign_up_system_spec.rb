require "rails_helper"

RSpec.describe "the user sign up process", :type => :feature do

  before :each do
    @user = FactoryBot.build(:user, first_name: 'John3', last_name: 'Jones3', email: 'jjones3@gmail.com', phone: '9061334567', username: 'jjones3', password: 'password')
  end

  it "creates a new user and displays correct success message when valid entries are submitted on the user sign up form" do
    visit '/users/sign_up'
    within("#new_user") do
      fill_in 'user_first_name', with: @user.first_name
      fill_in 'user_last_name', with: @user.last_name
      fill_in 'user_email', with: @user.email
      fill_in 'user_phone', with: @user.phone
      fill_in 'user_username', with: @user.username
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password
    end
    click_button 'Sign Up'
    @user.save
    expect(page).to have_content "You have signed up successfully."
  end


end