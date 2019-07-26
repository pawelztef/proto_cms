class Admin::MediaController < Admin::AdminsController
  before_action :set_media, only: [:destroy]
  before_action :set_title
  skip_before_action :verify_authenticity_token

  def index
    @all_media = Media.all
  end

  def new
    @media = Media.new
  end

  def create
    respond_to do |format|
      @media = Media.new
      @media.attachment = params[:files][0]
      if @media.save
        format.js { redirect_to admin_users_path , notice: 'User was successfully created.' }
      else
        format.js { render :index }
      end
    end
  end

  def destroy
    @media.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path , notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

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
