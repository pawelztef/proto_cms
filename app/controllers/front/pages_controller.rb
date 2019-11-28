class Front::PagesController < Front::FrontController
  def show
    @page = Page.find_by_permalink!(params[:id]).becomes(Page)
    @title = @page.name
  end
end
