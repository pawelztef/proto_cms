class Front::PagesController < Front::PublishablesController
  

  def show
    @publishable = Page.find_by_permalink(params[:publishable])
    render 'front/themes/pages/show', layout: default_layout
  end

end
