class Front::PublishablesController < ApplicationController


  def index
    @publishable = Site.instance.home_page
    render 'front/themes/pages/show', layout: default_layout
  end

  def show
    @publishable = Page.find_by_permalink(params[:publishable])
    if @publishable.is_home?
      redirect_to root_path
    elsif @publishable.is_blog?
      @posts = Post.all
      render 'front/themes/posts/index', layout: blog_layout
    else
      render 'front/themes/pages/show', layout: default_layout
    end
  end

  private 

  def set_publishable
    @publishable = Publishable.find_by_permalink(params[:publishable])
  end

  def check_status
    redirect_to root_path unless @publishable.published?
  end

  def blog_layout 
    'front/themes/layouts/blog'
  end

  def default_layout
    'front/themes/layouts/pages'
  end

end
