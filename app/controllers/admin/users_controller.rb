class Admin::UsersController < Admin::AdminsController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /admins/users
  # GET /admins/users.json
  def index
    @title = "List Users"
    @admins_users = User.all
  end

  # GET /admins/users/1
  # GET /admins/users/1.json
  def show

  end

  # GET /admins/users/new
  def new
    @title = "New User"
    @admins_user = User.new
  end

  # GET /admins/users/1/edit
  def edit
    @title = "Edit Profile"
  end

  # POST /admins/users
  # POST /admins/users.json
  def create
    @admins_user = User.new(admins_user_params)

    respond_to do |format|
      if @admins_user.save
        format.html { redirect_to admin_users_path , notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @admins_user }
      else
        format.html { render :new }
        format.json { render json: @admins_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/users/1
  # PATCH/PUT /admins/users/1.json
  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    respond_to do |format|
      if @admins_user.update(admins_user_params)
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @admins_user }
      else
        format.html { render :edit }
        format.json { render json: @admins_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/users/1
  # DELETE /admins/users/1.json
  def destroy
    @admins_user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path , notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @admins_user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admins_user_params
    params.require(:user).permit(:username, :first_name, :second_name, :email, :password)
  end
end
