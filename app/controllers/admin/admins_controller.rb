class Admin::AdminsController < ApplicationController
  before_action :authenticate_user!
  layout 'admin/layouts/admin'
  skip_before_action :verify_authenticity_token
end
