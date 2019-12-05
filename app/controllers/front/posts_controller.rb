class Front::PostsController < ApplicationController
  layout 'front/themes/layouts/blog'
  def index
    @posts = Post.all.where(status: 1)
  end

  def show
    @post = Post.find_by_permalink(params[:id])
      render 'front/themes/posts/show'
  end
end
