class Admin::PublishableGroupsController < Admin::AdminsController

  def show
    byebug
    @publishables = PublishableGroup.find_by_permalink(params[:publishable_group_id]).publishables
  end

end
