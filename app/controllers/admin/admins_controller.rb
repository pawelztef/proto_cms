class Admin::AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :publishable_groups
  layout 'admin/layouts/admin'
  skip_before_action :verify_authenticity_token

  def publishable_groups
    @publishable_groups =  PublishableGroup.all
  end
end
