class Admin::MediaController < Admin::AdminsController
  before_action :set_title

  def index

  end


  private
  def set_title
    @title = "Media"
  end

end
