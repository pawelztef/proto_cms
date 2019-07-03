class Admin::PagesController < Admin::AdminsController
  before_action :set_admin_page, only: [:show, :edit, :update, :destroy]

  def index
    @title = "List Pages"
    @admin_pages = Page.all
  end

  def show
  end

  def new
    @title = "New Page"
    @admin_page = Page.new
  end

  def edit
    @title = "Edit Page"
  end

  def create
    @admin_page = Page.new(admin_page_params)

    respond_to do |format|
      if @admin_page.save
        format.html { redirect_to admin_pages_path, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @admin_page }
      else
        format.html { render :new }
        format.json { render json: @admin_page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_page.update(admin_page_params)
        format.html { redirect_to admin_pages_path, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_page }
      else
        format.html { render :edit }
        format.json { render json: @admin_page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_page.destroy
    respond_to do |format|
      format.html { redirect_to admin_pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_admin_page
      @admin_page = Page.find(params[:id])
    end
    def admin_page_params
      params.require(:admin_page).permit(:permalink, :content, :name)
    end
end
