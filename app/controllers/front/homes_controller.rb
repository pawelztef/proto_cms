class Front::HomesController < Front::PublishablesController
  def index
    byebug
    #pages
  end
  def show
    byebug
    @publishable = Site.instance.home_page
    render 'front/themes/pages/show', layout: default_layout
  end
end

