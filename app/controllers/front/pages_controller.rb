class Front::PagesController < ApplicationController
  layout :set_layout

  before_action :set_page
  append_before_action :check_visibility, only: :show, unless: -> { @page.nil? }

  def index
    @page = HomePage.instance
    render 'front/themes/pages/show'
  end

  def show
    case @page.class.name
    when "HomePage"
      render 'front/themes/pages/show'
    when "Blog"
      render 'front/themes/posts/index'
    else
      render 'front/themes/pages/show'
    end
  end

  private 

  def set_page
    @page = Page.find_by_permalink(params[:permalink])
  end

  def check_visibility
    redirect_to root_path unless @page.visible?
  end

  def set_layout
    if @page.is_a?(Blog)
      'front/themes/layouts/blog'
    else
      'front/themes/layouts/front'
    end
  end

end
