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