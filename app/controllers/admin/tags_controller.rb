class Admin::TagsController < ApplicationController
  before_action :set_admin_tag, only: [:show, :edit, :update, :destroy]

  def index
    @admin_tags = Tag.all
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

    respond_to do |format|
      if @admin_tag.save
        format.html { redirect_to @admin_tag, notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @admin_tag }
      else
        format.html { render :new }
        format.json { render json: @admin_tag.errors, status: :unprocessable_entity }
      end
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
      format.html { redirect_to admin_tags_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_admin_tag
      @admin_tag = Tag.find(params[:id])
    end

    def admin_tag_params
      params.require(:admin_tag).permit(:name)
    end
end
