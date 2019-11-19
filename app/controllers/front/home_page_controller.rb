class Front::HomePageController < ApplicationController
  layout "front"
  def show
    @page = HomePage.instance.becomes(Page)
  end
end
