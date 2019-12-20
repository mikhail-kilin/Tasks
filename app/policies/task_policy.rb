class TaskPolicy
    def initialize(task, user)
      @task = task
      @user = user
    end
  
    def can_use?
      @task.user == @user
    end
end