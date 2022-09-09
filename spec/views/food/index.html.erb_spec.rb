require 'rails_helper'

RSpec.describe 'tests for sign_in page', type: :feature do
  describe 'test for sign up and login' do
    scenario ' I can see the name of all foods listed.' do
      visit '/users/sign_up'

      user = User.create!(name: 'test', email: 'test@example.com', password: 'f4k3p455w0rd')
      user.confirmed_at = Time.now
      user.save

      expect(page).to have_content("Didn't receive confirmation instructions")
    end
    scenario 'I can see text Log in' do
      visit '/users/sign_in'

      expect(page).to have_content('Log in')
    end
  end
end

# #  RSpec.describe "Signing in", type: :feature  do
# #   background do
# #     User.create(email: 'user@example.com', password: 'caplin')
# #   end

# #   scenario "Signing in with correct credentials" do
# #     visit '/sessions/new'
# #     within("#session") do
# #       fill_in 'Email', with: 'user@example.com'
# #       fill_in 'Password', with: 'caplin'
# #     end
# #     click_button 'Sign in'
# #     expect(page).to have_content 'Success'
# #   end

# #   given(:other_user) { User.create(email: 'other@example.com', password: 'rous') }

# #   scenario "Signing in as another user" do
# #     visit '/sessions/new'
# #     within("#session") do
# #       fill_in 'Email', with: other_user.email
# #       fill_in 'Password', with: other_user.password
# #     end
# #     click_button 'Sign in'
# #     expect(page).to have_content 'Invalid email or password'
# #   end
# # end

# describe "the signin process", type: :feature do
#   before :each do
#     User.create(email: 'user@example.com', password: 'password')
#   end

#   it "signs me in" do
#     visit 'users/sign_up'
#     within("#session") do
#       fill_in 'Email', with: 'user@example.com'
#       fill_in 'Password', with: 'password'
#     end
#     click_button 'Sign in'
#     expect(page).to have_content 'Success'
#   end
# end
