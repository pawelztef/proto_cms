class Front::HomePageController < ApplicationController
  layout "front"
  def show
    @page = HomePage.get_page
  end
end
