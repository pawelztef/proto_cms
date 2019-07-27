class Admin::MediaController < Admin::AdminsController
  before_action :set_media, only: [:destroy]
  before_action :all_media, only: [:destroy, :index]

  before_action :set_title
  skip_before_action :verify_authenticity_token

  respond_to :html, :js

  def index
    binding.pry
  end

  def new
    @media = Media.new
  end

  def create
    # TODO use sanitaize params
    respond_to do |format|
      @media = Media.new
      @media.attachment = params[:files][0]
      if @media.save
        format.js { redirect_to admin_media_index_path, notice: 'Attachment was successfully created.' }
      else
        format.js { render :index }
      end
    end
  end

  def destroy
    # binding.pry
    @media.destroy
    respond_to do |format|
      # format.html { redirect_to admin_media_index_path, notice: 'Attachement was successfully destroyed.' }
      format.js 
      # format.json { head :no_content }
    end
  end

  private

  def all_media
    @all_media = Media.all
  end

  def set_media
    @media = Media.find(params[:id])
  end

  def set_title
    @title = "Media"
  end

  def media_params
    params.require(:media).permit(:attachment)
  end

end
