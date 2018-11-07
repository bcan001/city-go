# require "rails_helper"

# RSpec.describe "the events index page", :type => :feature do

#   before :each do
#   	@artist = FactoryBot.create(:artist)
#   	@venue = FactoryBot.create(:venue)
#   	@event = FactoryBot.create(:event, artists: [@artist], venue: @venue, event_date: Time.now.to_datetime)
#     @events = [@event]
#   end

#   it "has the upvote event button if there is a current user" do
#     @user = FactoryBot.create(:user, first_name: 'Alexander', last_name: 'Ovechkin', email: 'ovierules@gmail.com', phone: '9061334567', username: 'ovierules', password: 'password')

#     visit '/users/sign_in'
#     within("#new_user") do
#       fill_in 'user_email', with: @user.email
#       fill_in 'user_password', with: @user.password
#     end
#     click_button 'Log In'

#     visit events_path
#     expect(page).to have_content "Upvote Event"
# 	end

#   it "does not have the upvote event button if there is not a current user" do
#     visit events_path
#     expect(page).to_not have_content "Upvote Event"
#   end


  
# end
