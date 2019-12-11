class Front::PagesController < Front::PublishablesController
  
  def index
    @publishable ||= HomePage.instance
    render 'front/themes/pages/show'
  end

  def show
      render 'front/themes/pages/show'
  end

end
