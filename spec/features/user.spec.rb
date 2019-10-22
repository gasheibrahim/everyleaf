# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "user management function", type: :feature do
 # In scenario (alias of it), write the processing of the test for each item you want to check.
 background do
   User.create!(fullname: "ibra", email: 'ibra@gmail.Com', password: '1234567890')
   visit  login_path
   #click_on 'Login'
   fill_in  'Email' ,  with: 'ibra@gmail.Com'
   fill_in  'Password' ,  with: '1234567890'
   click_on  'SignIn'
 end
 scenario "Test number of users" do
   User.create!(fullname: 'ibra', email: 'ibra@gmail.com', password: '1234567890')
   @user = User.all.count
   expect(@user).to eq 2
 end
 scenario "Test user list" do
   User.create!(fullname: 'ibra', email: 'ibra@gmail.com', password: '1234567890')
   visit admin_users_path
   expect(page ).to  have_content  'ibra'
   expect(page ).to  have_content  'ibra'
 end
 scenario "Test user creation" do
   User.create!(fullname: 'ibra', email: 'ibra@gmail.com', password: '1234567890')
   visit admin_users_path
   expect(page ).to  have_content  'ibra'
 end
 scenario "test enable user creation page" do
   visit admin_users_path
   expect(page ).to  have_content  'ibra'
 end
 scenario "Test user details" do
   @user= User.create!(fullname: 'ibra', email: 'ibra@gmail.com', password: '1234567890')
   visit admin_user_path(id: @user.id)
   expect(page).to have_content('ibra@gmail.com')
   expect(page).to have_content('admin')
 end
 scenario "Test task updating" do
   @user = User.first
   visit edit_admin_user_path(id: @user.id)
   fill_in 'Name', with: 'name update'
   #fill_in 'Content', with: 'content update'
   click_on 'signup'
   visit admin_users_path
   expect(page).to have_content('name update')
   #expect(page).to have_content('content update')
 end
 scenario 'Test user Deletion' do
   User.create!(fullname: 'ibra', email: 'ibra@gmail.com', password: '1234567890')
   @user = User.last
   @user.destroy
   # expect(page).to have_content('testtesttest')
   # click_on 'Destroy'
   visit users_path
   expect(page).not_to have_content('ibra')
 end
end