class Front::PublishablesController < ApplicationController
  layout :set_layout

  before_action :set_publishable
  append_before_action :check_status , only: :show, unless: -> { @publishable.nil? }

  def index
    @publishable ||= HomePage.instance
    render 'front/themes/pages/show'
  end

  def show
    case @publishable.class.name
    when "HomePage"
      redirect_to root_url
    when "Blog"
      @posts = Blog.instance.posts
      render 'front/themes/posts/index'
    when "Post"
      @publishable.permalink  = [@publishable.parent.permalink, @publishable.permalink].join('/') if @publishable.parent.present?
      byebug
      render 'front/themes/posts/show'
    else
      render 'front/themes/pages/show'
    end
  end

  def blog

  end

  def new_comment
    byebug
  end

  private 

  def set_publishable
    @publishable = Publishable.find_by_permalink(params[:publishable])
  end

  def check_status
    redirect_to root_path unless @publishable.published?
  end

  def set_layout
    if @publishable.is_a?(Blog)
      'front/themes/layouts/blog'
    else
      'front/themes/layouts/front'
    end
  end

end
