class Front::PostsController < ApplicationController
  layout 'blog'
  def index
    @posts = Post.all.where(status: 1)
  end

  def show
    @post = Post.find_by_permalink(params[:id])
  end
end
