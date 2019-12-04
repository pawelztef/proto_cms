class Front::PagesController < ApplicationController
  layout 'front/themes/layouts/front'
  def index
    @page = HomePage.instance
    render 'front/themes/pages/show'
  end

  def show
    @page = Page.find_by_permalink(params[:permalink]) 
    if @page.visible
      render 'front/themes/pages/show'
    else 
      # TODO redirect to 404
      redirect_to root_path
    end
  end

end
