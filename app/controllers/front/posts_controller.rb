class Front::PostsController < Front::PublishablesController
  def show
    #PS
    binding.pry
    @publishable = Post.find_by_peramalink(params[:post_id])
    render 'front/themes/posts/show', layout: blog_layout
  end
end
