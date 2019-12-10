class Admin::SitesController < Admin::AdminsController
  before_action :set_title
  before_action :set_instance

  def index
    render 'admin/sites/settings'
  end


  def edit
    #render 'admin/sites/settings'
  end

  def update
    if @site.update(site_params)
      Page.find(site_params[:blog_page_id])
          .update(status: site_params[:visibility].to_i) if site_params[:blog_page_id]
      redirect_to admin_sites_path, notice: "Site setting was successfully updated."
    else 
      flash[:alert] = "There were issues while saving your settings."
      render 'admin/sites/settings', locals: { page: blog_page.to_json, active_form: "blog" }
    end
  end


  def settings_forms
    respond_to do |format|
      format.js
    end
  end

  def destroy_img
    if params[:button] == "logo"
      @site.logo.purge
      redirect_to admin_sites_path, notice: "Logo image was successfully destroyed."
    elsif params[:button] == "favicon"
      @site.favicon.purge
      redirect_to admin_sites_path, notice: "Favicon image wase successfully destroyed."
    else
      redirect_to admin_sites_path, alert: "Action not recognized!"
    end
  end

  private

  def set_instance
    @site = Site.instance
  end

  def set_title
    @title = "Settings"
  end

  def site_params
    params.require(:site).permit(:company_name,
                                 :catch_phrase,
                                 :logo,
                                 :favicon,
                                 :home_page_id,
                                 :blog_page_id,
                                 :commentable,
                                 :visibility,
                                 :max_comment_nesting)
  end

end
