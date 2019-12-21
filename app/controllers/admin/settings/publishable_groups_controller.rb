class Admin::Settings::PublishableGroupsController < Admin::AdminsController
  before_action :set_title
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  authorize_resource 

  def index
    @groups = PublishableGroup.all
    @group = PublishableGroup.new
  end

  def create
    @groups = PublishableGroup.all
    @group = PublishableGroup.new(group_params)
    @group.site = Site.instance
    if @group.save
      redirect_to admin_settings_publishable_groups_url,
      notice: "Content group setting was successfully updated."
    else 
      render :index,
      alert: "There were issues while saving your settings."
    end
  end


  def edit
    respond_to do |format|
      format.js {render layout: false }
      format.html
    end
  end

  def update
    if @group.update(site_params)
      redirect_to admin_settings_site_path,
        notice: "Content group setting was successfully updated."
    else 
      render admin_settings_site_path,
        alert: "There were issues while saving your settings."
    end
  end


  def destroy
    @group.destroy
    @groups = PublishableGroup.all
    respond_to do |format|
      format.js 
    end
  end

  private

  def set_group
    @group = PublishableGroup.find_by_permalink!(params[:id])
  end

  def set_title
    @title = "Settings"
  end

  def group_params
    params.require(:publishable_group).permit(:name,
                                               :permalink,
                                               :description,
                                               :commentable,
                                               :max_comment_nesting,
                                               :site_id,
                                               :icon)
  end

end
