class Front::CommentsController < ApplicationController
    layout "front"
    before_action :authenticate_reader!
    
    def new
      @comment = Comment.new
    end

    def create
      @comment = @commentable.comments.new(comment_params)
      @comment.reader = current_reader
      if @comment.save
        redirect_to @commentable
      else
        redirect_to @commentable, alert: "Somethings went wrong"
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body, :parent_id)
    end

end
