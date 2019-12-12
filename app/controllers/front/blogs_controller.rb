class Front::BlogsController < Front::PublishablesController
  def index
    byebug
    #blog
  end
  def show
    @publishable = Site.instance.blog_page
    @posts = Posts.all
    render 'front/themes/posts/index', layout: blog_layout
  end
end
