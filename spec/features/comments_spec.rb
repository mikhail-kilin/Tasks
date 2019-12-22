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

  scenario "edit comment" do
    create_task
    message1 = "message1"
    create_comment message1
    message2 = "message2"
    click_on(class: 'edit')
    create_comment message2
    expect(page).to have_content 'Comment was successfully updated.'
    expect(page).to have_content message2
    expect(page).to_not have_content message1
  end
end

def create_comment(message)
  fill_in :comment_content, with: message
  click_button "Submit"
end