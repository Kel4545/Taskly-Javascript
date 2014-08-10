require 'rails_helper'
require 'capybara/rails'

feature 'Task lists' do

  scenario 'User can view tasks lists' do
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    TaskList.create!(name: "Household Chores")

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    expect(page).to have_content("Work List")
    expect(page).to have_content("Household Chores")
  end

  scenario 'User can add a task list' do
    user_signs_in
    click_link "Add Task List"
    fill_in "Name", with: "Kitten List"
    click_button "Create Task List"
    expect(page).to have_content("Task List was created successfully!")
    expect(page).to have_content("Grocery List")
  end

  scenario "Users cannot leave task List empty" do
    user_signs_in
    click_link "Add Task List"
    fill_in "Name", with ""
    click_button "Create Task List"
    expect(page).to have_content("Your task could not be created")
  end

  scenario "Users can edit their task lists" do
    user_signs_in
    click_link "Edit"
    fill_in "Name", with "Kitten Butt"
    click_button "Update Task List"
    expect(page).to have_content("Task List was updated succesfully")
    expect(page).to have_content("Kitten Butt")
    expect(page).to_not have_content("Kitten List")
  end

  scenario "Users can add tasks to task lists" do
    user_signs_in
    user_adds_task
    expect(page).to have_content("Kitten food")
  end

  scenario "Users can delete tasks" do
    user_signs_in
    user_adds_task
    expect(page).to have_content("Kitten Butt")
    expect(page).to have_content("Kitten food")
    first('.task-list').click_link('Delete')
    expect(page).to_not have_content("Kitten food")
    expect(page).to have_content("Task was deleted successfully!")
  end

end