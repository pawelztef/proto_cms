class Previews::PagesController < ApplicationController
  layout "admin_previews"
  def show
    @page = Page.find_by_permalink!(params[:id])
    @title = @page.name
  end
end
