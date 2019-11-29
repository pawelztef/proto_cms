class Front::PagesController < ApplicationController
  layout 'front/themes/layouts/front'
  def index
    @page = HomePage.instance
    render 'front/themes/pages/show'
  end

  def show
    @page = Page.find_by_permalink(params[:permalink])
    render 'front/themes/pages/show'
  end

end
