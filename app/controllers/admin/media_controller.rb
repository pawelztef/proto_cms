class Admin::MediaController < Admin::AdminsController
  before_action :set_title
  skip_before_action :verify_authenticity_token

  def index
  end

  def new
    @media = Media.new
  end

  def create
    respond_to do |format|
        byebug
      if @admins_user.save
        format.js { redirect_to admin_users_path , notice: 'User was successfully created.' }
      else
        format.js { render :index }
      end
    end
  end

  private
  def set_title
    @title = "Media"
  end

  def media_params
    params.require(:media).permit(:attachment)
  end

end
