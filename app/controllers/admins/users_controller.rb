class Admins::UsersController < ApplicationController
  before_action :set_admins_user, only: [:show, :edit, :update, :destroy]

  # GET /admins/users
  # GET /admins/users.json
  def index
    @admins_users = Admins::User.all
  end

  # GET /admins/users/1
  # GET /admins/users/1.json
  def show
  end

  # GET /admins/users/new
  def new
    @admins_user = Admins::User.new
  end

  # GET /admins/users/1/edit
  def edit
  end

  # POST /admins/users
  # POST /admins/users.json
  def create
    @admins_user = Admins::User.new(admins_user_params)

    respond_to do |format|
      if @admins_user.save
        format.html { redirect_to @admins_user, notice: 'User was successfully created.' }
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
    respond_to do |format|
      if @admins_user.update(admins_user_params)
        format.html { redirect_to @admins_user, notice: 'User was successfully updated.' }
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
      format.html { redirect_to admins_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_user
      @admins_user = Admins::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admins_user_params
      params.fetch(:admins_user, {})
    end
end
