class AddUsersToTasksAndComments < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :user_id, :integer
    add_column :comments, :user_id, :integer
  end
end
