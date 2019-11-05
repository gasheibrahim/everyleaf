# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "user management function", type: :feature do
 # In scenario (alias of it), write the processing of the test for each item you want to check.
 background do
   User.create!(fullname: "oppa", email: 'oppa@gmail.Com', phonenumber: '0789859109', password: '1234567890')
   visit  new_session_path
   #click_on 'Login'
   fill_in  'Email' ,  with: 'oppa@gmail.Com'
   fill_in  'Password' ,  with: '1234567890'
   click_on  'Login'
 end
 scenario "Test number of users" do
   User.create!(fullname: 'oppa', email: 'oppa@gmail.com', phonenumber: '0789859109', password: '1234567890')
   @user = User.all.count
   expect(@user).to eq 2
 end
 scenario "Test user list" do
   User.create!(fullname: 'oppa', email: 'oppa@gmail.com', phonenumber: '0789859109', password: '1234567890')
   visit admin_users_path
   # expect(page).to have_content'oppa'
   # expect(page).to have_content'oppa'
 end
 scenario "Test user creation" do
   User.create!(fullname: 'oppa', email: 'oppa@gmail.com', phonenumber: '0789859109', password: '1234567890')
   visit admin_users_path
   # expect(page ).to  have_content 'oppa'
 end
 scenario "test enable user creation page" do
   visit admin_users_path
   # expect(page ).to  have_content('oppa')
 end
 scenario "Test user details" do
   @user= User.create!(fullname: 'oppa', email: 'oppa@gmail.com', phonenumber: '0789859109', password: '1234567890')
   visit admin_user_path(id: @user.id)
   expect(page).to have_content('oppa@gmail.com')
 end
 scenario "Test task updating" do
   @user = User.first
   visit edit_admin_user_path(id: @user.id)
   fill_in 'Fullname', with: 'gashema'
   click_on '更新する'
   visit admin_users_path
   # expect(page).to have_content('gashema')
 end
 scenario 'Test user Deletion' do
   User.create!(fullname: 'oppa', email: 'oppa@gmail.com', phonenumber: '0789859109', password: '1234567890')
   @user = User.first
   @user.destroy
   # expect(page).to have_content('testtesttest')
   # click_on 'Destroy'
   visit users_path
   # expect(page).not_to have_content('gashema')
 end
end