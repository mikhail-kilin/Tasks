class CommentPolicy
    def initialize(comment, user)
      @comment = comment
      @user = user
    end
  
    def can_use?
      @comment.user == @user
    end
end