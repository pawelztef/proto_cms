class Admin::PublishablesController < Admin::AdminsController
  def index
    @admin_publishable_group = PublishableGroup.find_by_permalink(params[:publishable_group_id])
    @admin_publishables = @admin_publishable_group.publishables
    @admin_publishable_stats = Publishable.get_stats
    byebug
    @title = "List Publishables of type #{@admin_publishable_group.name}"
  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end


end