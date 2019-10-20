class Front::PagesController < ApplicationController
  layout "front"
  def show
    @page = Page.find_by_permalink!(params[:id])
    @title = @page.name
  end
end
