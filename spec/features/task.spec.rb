# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
 # In scenario (alias of it), write the processing of the test for each item you want to check.
 
background do
   User.create!(fullname: "ibra", email: 'ibra@gmail.Com', phonenumber: '0789859109', password: '1234567890')
   visit  new_session_path
   #click_on 'Login'
   fill_in  'Email' ,  with: 'ibra@gmail.Com'
   fill_in  'Password' ,  with: '1234567890'
   click_on  'Login'
   visit  new_task_path
   #click_on 'New Task'
     fill_in  'Name' ,  with: 'ibrahim'
     #fill_in  'priority' ,  with: 'priority1'
     # fill_in  'status' ,  with: 'status1'
     # fill_in  'priority' ,  with: 'Priority1'
     click_on '登録する'
 end

 scenario "Test task list" do
   visit tasks_path
 end
 scenario "Test task creation" do
 
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
   visit new_task_path
# In the input field labeled "Task Name" and in the input field labeled "Task Details"
# Fill in the task title and content respectively
fill_in  'Name' ,  with: 'task details'
# Click_on a button with a value (notation letter) of “Register”
click_on  '登録する'
@task=Task.first
 end
 scenario "Test whether tasks are arranged in descending order of creation date" do
  visit  new_task_path
     fill_in  'Name' ,  with: 'task1'
     click_on '登録する'
     visit  new_task_path
     fill_in  'Name' ,  with: 'task2'
     click_on '登録する'
     visit  new_task_path
     fill_in  'Name' ,  with: 'task3'
     click_on '登録する'
     visit tasks_path
   # Task.create!(name: 'test_task_01', content: 'testtesttest', status: 'completed', priority: 'medium',start_date: '10.2.2019', end_date: '20.10.2019')
   # Task.create!(name: 'test_task_02', content: 'testtesttest2', status: 'completed', priority: 'medium',start_date: '10.2.2019', end_date: '20.10.2019')
   
   @task = Task.order('created_at DESC')
 end
 scenario "Test task updating" do
   visit  new_task_path
     fill_in  'Name' ,  with: 'task1'
     click_on '登録する'
     visit  new_task_path
     fill_in  'Name' ,  with: 'task2'
     click_on '登録する'
     visit  new_task_path
     fill_in  'Name' ,  with: 'task3'
     click_on '登録する'
 @meme = Task.where(:name => "task3")
  @meme.update(:name => "Balloon frightens cat")
   visit tasks_path
 end
 scenario 'Test Task Deletion' do
  User.create!(fullname: 'oppa', email: 'oppa@gmail.com', phonenumber: '0789859109', password: '1234567890')
   @user = User.first
   @user.destroy
   # expect(page).to have_content('testtesttest')
   # click_on 'Destroy'
   visit users_path
   # expect(page).not_to have_content('gashema')
 end
 scenario "test if search works" do
   visit tasks_path
   fill_in  'search' ,  with: 'test_task_01'
   click_on 'search by Name'
   #expect(page).to have_content('test_task_01')
 end
 scenario "test task search by atached labels " do
   visit new_label_path
   fill_in 'Name', with: 'label title1'
   fill_in 'Content', with: 'label content1'
   click_on '登録する'
   visit new_label_path
   fill_in 'Name', with: 'label title2'
   fill_in 'Content', with: 'label content2'
   click_on '登録する'
   @task = Task.first
   @label1 = Label.first
   @label2 = Label.last
   visit tasks_path
   fill_in  'search3' ,  with: 'label title1'
   click_on 'search by label'
 end
end


