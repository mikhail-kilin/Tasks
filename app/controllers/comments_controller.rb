class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_comment, only: [:edit, :update, :destroy]
    
    def create
        @task = Task.find(params[:task_id])

        @comment = current_user.comments.new(comment_params)
        @comment.task = @task
        if @comment.save
          redirect_to @task, notice: 'Comment was successfully created.'
        else
          redirect_to @task, alert: 'Comment shouldn`t be empty'
        end
    end

    def edit
    end

    def update
        if @comment.update(comment_params)
          redirect_to @comment.task, notice: 'Comment was successfully updated.'
        else
          render :edit
        end
    end

    def destroy
        task = @comment.task
        @comment.destroy
        redirect_to task, notice: 'Comment was successfully destroyed.'
    end

    private

      def set_comment
        @comment = current_user.comments.find(params[:id])
        @task = @comment.task
        @comment_policy = CommentPolicy.new(@comment, current_user)
      end

      def comment_params
          params.require(:comment).permit(:content)
      end
end