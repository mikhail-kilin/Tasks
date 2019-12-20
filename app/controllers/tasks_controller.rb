class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = current_user.tasks.order(created_at: :desc)
  end

  def show
    @comment = current_user.comments.new
  end

  def new
    @task = current_user.tasks.new
  end

  def edit
  end

  def create
    params = task_params
    params[:done] = false
    @task = current_user.tasks.new(params)

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    params = task_params
    params[:done] = @task.done
    if @task.update(params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  def make_done
    task = current_user.tasks.find(params[:task_id])
    task.done=true
    task.save

    redirect_to task
  end

  def done
    @tasks = current_user.tasks.where(done: true).order(created_at: :desc)
  end

  def not_done
    @tasks = current_user.tasks.where(done: false).order(created_at: :desc)
  end

  private
    def set_task
      @task = current_user.tasks.find(params[:id])
      @task_policy = TaskPolicy.new(@task, current_user)
    end

    def task_params
      params.require(:task).permit(:title, :content, :done)
    end
end