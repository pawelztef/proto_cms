class Admins::AdminsController < ApplicationController
 before_action :authenticate_admin!
 layout 'admin'

 def index
   @admins = Admin.all
 end

 def show

 end

end
