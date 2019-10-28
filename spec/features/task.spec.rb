# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
 # In scenario (alias of it), write the processing of the test for each item you want to check.
 
background do
   User.create!(fullname: "ibrahim", email: 'ibrahim@gmail.Com', phonenumber: '0789859109', password: '1234567890')
   visit  new_session_path
   #click_on 'Login'
   fill_in  'Email' ,  with: 'ibrahim@gmail.Com'
   fill_in  'Password' ,  with: '1234567890'
   click_on  'Login'
   visit  tasks_path
   click_on 'New Task'
     fill_in  'Name' ,  with: 'task1'
     #fill_in  'priority' ,  with: 'priority1'
     # fill_in  'status' ,  with: 'status1'
     # fill_in  'priority' ,  with: 'Priority1'
     click_on '登録する'
 end

 scenario "Test task list" do
   @user= User.create!(fullname: "ibrahim", email: 'ibrahim@gmail.Com', phonenumber: '0789859109', password: '1234567890')
   Task.create!(name: 'test_task_01', content: 'testtesttest', status: 'completed', priority: 'medium',start_date: '10.2.2019', end_date: '20.10.2019', user_id:@user.id)
   Task.create!(name: 'test_task_02', content: 'testtesttest2', status: 'completed', priority: 'medium',start_date: '10.2.2019', end_date: '20.10.2019', user_id:@user.id)
    visit tasks_path
   # Write a test that you expect to get wrong results
   expect(page).to have_content 'testtesttest'
   expect(page).to have_content 'testtesttest'
 end
 scenario "Test task creation" do
 @user= User.create!(fullname: "ibrahim", email: 'ibrahim@gmail.Com', phonenumber: '0789859109', password: '1234567890')
# visit to new_task_path (transition to task registration page)
visit new_task_path
# In the input field labeled "Task Name" and in the input field labeled "Task Details"
# Fill in the task title and content respectively
fill_in  'Name' ,  with: 'completed'
# Click_on a button with a value (notation letter) of “Register”
click_on  '登録する'
# Check if the information that is supposed to be registered by click is displayed on the task detail page
# (Assumption that transition to the task details screen will be made if the task is registered)
end
 scenario "Test task details" do
  @user= User.create!(fullname: "ibrahim", email: 'ibrahim@gmail.Com', phonenumber: '0789859109', password: '1234567890')
   @task = Task.create!(name: 'test_task_01', content: 'testtesttest', status: 'completed', priority: 'medium',start_date: '10.2.2019', end_date: '20.10.2019', user_id:@user.id)
   visit task_path(id: @task.id)
   expect(page).to have_content('test_task_01')
   expect(page).to have_content('testtesttest')
 end
 scenario "Test whether tasks are arranged in descending order of creation date" do
  @user= User.create!(fullname: "ibrahim", email: 'ibrahim@gmail.Com', phonenumber: '0789859109', password: '1234567890')
   Task.create!(name: 'test_task_01', content: 'testtesttest', status: 'completed', priority: 'medium',start_date: '10.2.2019', end_date: '20.10.2019', user_id:@user.id)
   Task.create!(name: 'test_task_02', content: 'testtesttest2', status: 'completed', priority: 'medium',start_date: '10.2.2019', end_date: '20.10.2019', user_id:@user.id)
   @task = Task.order('created_at DESC')
 end
 scenario "Test task updating" do
  @user= User.create!(fullname: "ibrahim", email: 'ibrahim@gmail.Com', phonenumber: '0789859109', password: '1234567890')
   task1=Task.create!(name: 'test_task_01', content: 'testtesttest', status: 'completed', priority: 'medium',start_date: '10.2.2019', end_date: '20.10.2019', user_id:@user.id)
   visit edit_task_path(id: task1.id)
   fill_in 'Name', with: 'name update'
   click_on '更新する'
   visit tasks_path
   expect(page).to have_content('name update')
 end
 scenario 'Test Task Deletion' do
  @user= User.create!(fullname: "ibrahim", email: 'ibrahim@gmail.Com', phonenumber: '0789859109', password: '1234567890')
   Task.create!(name: 'test_task_01', content: 'testtesttest', status: 'completed', priority: 'medium',start_date: '10.2.2019', end_date: '20.10.2019', user_id:@user.id)
   visit tasks_path
   expect(page).to have_content('testtesttest')
   click_on 'Destroy'
   expect(page).not_to have_content('testtesttest')
 end
 scenario "test if search works" do
  @user= User.create!(fullname: "ibrahim", email: 'ibrahim@gmail.Com', phonenumber: '0789859109', password: '1234567890')
   Task.create!(name: 'test_task_01', content: 'testtesttest', status: 'completed', priority: 'medium',start_date: '10.2.2019', end_date: '20.10.2019', user_id:@user.id)   
   visit tasks_path
   fill_in  'search' ,  with: 'test_task_01'
   click_on 'search by Name'
   expect(page).to have_content('test_task_01')
 end
end


