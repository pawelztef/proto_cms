class Admin::PublishableGroupsController < Admin::AdminsController

  def index
    byebug
  end

  def show
    @publishables = PublishableGroup.find_by_permalink(params[:publishable_group_id]).publishables
  end

end
