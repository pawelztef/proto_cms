class Front::Publishables::CommentsController < Front::CommentsController
  before_action :set_commentable
  private
  def set_commentable
    @commentable = Post.find_by_permalink!(params[:post_id])
  end
end
