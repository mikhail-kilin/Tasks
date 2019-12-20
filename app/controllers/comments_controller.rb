class CommentsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @task = Task.find(params[:task_id])

        @comment = current_user.comments.new(comment_params)
        @comment.task = @task
        @comment.save

        redirect_to @task    
    end

    def comment_params
        params.require(:comment).permit(:content)
    end
end