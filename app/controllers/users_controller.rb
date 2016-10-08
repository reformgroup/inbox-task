class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  # TODO: This will check current role
  # before_action :correct_role
  
  layout 'sidebar'
  
  # GET /users
  def index
    @users = User.search(params[:search], :last_name, :first_name, :email).sorting(params[:sort], params[:direction]).paginate(page: params[:page])
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, success: t('.flash.success.message') }
      else
        format.html { render :new, danger: t('.flash.danger.message') }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, success: t('.flash.success.message') }
      else
        format.html { render :edit, danger: t('.flash.danger.message') }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url success: t('.flash.success.message') }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :last_name, :first_name, :email, :gender, :birth_date, :password, 
        :password_confirmation, :role, :avatar
      )
    end
end
