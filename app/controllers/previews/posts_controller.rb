class Previews::PostsController < ApplicationController
  layout "admin_previews"
  def show
    @post = Post.find_by_permalink!(params[:id])
    byebug
    @title = @post.title
  end
end
