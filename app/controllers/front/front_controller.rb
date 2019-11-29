class Front::FrontController < ApplicationController
  layout 'front/layouts/front'
  def index
    @page = HomePage.instance
  end
end
