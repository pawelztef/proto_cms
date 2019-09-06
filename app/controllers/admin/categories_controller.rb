class Admin::CategoriesController < Admin::AdminsController
  before_action :set_admin_category, only: [:show, :edit, :update, :destroy]
  before_action :all_categories, only: [:index, :destroy, :create]
  authorize_resource 

  def index
    @title = "List Categories"
    @admin_category = Category.new
  end

  def show
    @admin_category_posts = @admin_category.posts;
  end

  def new
    @admin_category = Category.new
  end

  def edit
  end

  def create
    @admin_category = Category.new(admin_category_params)
    @admin_category.save
    respond_to do |format|
      format.js { render  layout: false }
      format.html
    end
  end

  def update
    respond_to do |format|
      if @admin_category.update(admin_category_params) 
      format.html { redirect_to admin_categories_path, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_category }
      else
        format.html { render :edit }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_category.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def set_admin_category
    @admin_category = Category.find(params[:id])
  end

  def admin_category_params
    params.require(:category).permit(:name, :slug, :description, :parent_id)
  end

  def all_categories
    @admin_categories = Category.all
  end
end
