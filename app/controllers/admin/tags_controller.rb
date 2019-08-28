class Admin::TagsController < Admin::AdminsController
  before_action :set_admin_tag, only: [:show, :edit, :update, :destroy]
  before_action :all_tags, only: [:index, :destroy, :create]
  authorize_resource 

  def index
    @title = "List Tags"
    @admin_tag = Tag.new
  end

  def show
  end

  def new
    @admin_tag = Tag.new
  end

  def edit
  end

  def create
    @admin_tag = Tag.new(admin_tag_params)
    @admin_tag.save
    respond_to do |format|
      format.js { render  layout: false }
      format.html
    end
  end

  def update
    respond_to do |format|
      if @admin_tag.update(admin_tag_params)
        format.html { redirect_to @admin_tag, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_tag }
      else
        format.html { render :edit }
        format.json { render json: @admin_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_tag.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def set_admin_tag
    @admin_tag = Tag.find(params[:id])
  end

  def admin_tag_params
    params.require(:tag).permit(:name, :slug, :description)
  end

  def all_tags
    @admin_tags = Tag.all
  end

end
