require "rails_helper"

describe "As Guest I want to Sign In" do
  scenario "with correct password" do

    user = User.create email: "user@example.com",
                       password: "12345678"

    visit root_path

    click_on "Sign in"

    fill_in :user_email, with: "user@example.com"
    fill_in :user_password, with: "12345678"

    click_button "Sign-in-btn"

    expect(page).to have_link "Sign out"
  end

  scenario "with incorrect password" do
    user = User.create email: "user@example.com",
                       password: "12345678"

    visit root_path

    click_on "Sign in"

    fill_in :user_email, with: "user@example.com"
    fill_in :user_password, with: "87654321"

    click_button "Sign-in-btn"
    expect(page).to have_content("Invalid Email or password.")
    expect(page).not_to have_link "Sign out"
  end
end


