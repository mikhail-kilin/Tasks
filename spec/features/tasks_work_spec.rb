require "rails_helper"
require "create_task_helper"

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
