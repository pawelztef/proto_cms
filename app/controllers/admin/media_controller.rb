class Admin::MediaController < Admin::AdminsController
  before_action :set_title
  before_action :set_media, only: [:destroy, :edit]
  before_action :all_media, only: [:destroy, :index, :create, :gallery]


  def index
    respond_to do |format|
      format.js {render layout: false }
      format.html
    end
  end

  def gallery
    respond_to do |format|
      format.js {render layout: false }
      format.html
    end
  end

  def new
    @media = Media.new
  end

  def create
    # TODO use sanitaize params
     byebug
    @media = Media.new
    @media.attachment = params[:files][0]
    @media.title = params[:files][0].original_filename
    @media.save
    respond_to do |format|
      format.js { render layout: false }
      format.html
    end
  end

  def edit
    @media = Media.find(params[:id])
    respond_to do |format|
      format.js {render layout: false }
      format.html
    end
  end

  def update_image
    @media = Media.find(params[:media_id])
    @media.crop_and_save_with_options("new_file", params[:image])
  end

  def destroy
    @media.destroy
    respond_to do |format|
      format.js 
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