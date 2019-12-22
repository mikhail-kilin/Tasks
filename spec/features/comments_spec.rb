require "rails_helper"
require "create_task_helper"

describe "As User I want to work with Comments" do
  scenario "create comment" do
    create_task
    
    message = "Message"
    create_comment message

    expect(page).to have_content 'Comment was successfully created.'
    expect(page).to have_content message
  end

  scenario "create empty comment" do
    create_task
    
    message = ""
    create_comment message

    expect(page).to have_content 'Comment shouldn`t be empty'
  end
end

def create_comment(message)
  fill_in :comment_content, with: message
  click_button "Submit"
end