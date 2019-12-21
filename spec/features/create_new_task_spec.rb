require "rails_helper"

describe "As User I want to work with Task" do
  scenario "create task" do

    create_task

    expect(page).to have_content "Task1"
    expect(page).to have_content "Task1 content"
    expect(page).to have_link "Make_done"
  end

  scenario "make task done" do
    create_task

    click_on "Make_done"
    
    expect(page).to_not have_link "Make_done"

  end
end

private 

def create_task
    user = User.create email: "user@example.com",
                       password: "12345678"
    visit root_path
    click_on "Sign in"
    fill_in :user_email, with: "user@example.com"
    fill_in :user_password, with: "12345678"
    click_button "Sign-in-btn"

    visit new_task_path
    fill_in :task_title, with: "Task1"
    fill_in :task_content, with: "Task1 content"
    click_button "Submit"
end