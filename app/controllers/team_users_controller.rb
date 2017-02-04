class TeamUsersController < ApplicationController
  
  def index
    @users = User.order(:first_name).where("first_name like ?", "%#{params[:term]}%")
    render json: @users.map { |u| { value: u.id, label: u.name } }
  end
  
  def new
    @team = Team.find(params[:team_id])
    @team_users = @team.team_users
    @new_team_user = @team.team_users.build(user_id: params[:user_id])
    respond_to do |format|
      format.html { render :new }
      format.js {}
    end
  end
  
  def create
    @team = TeamUser.new(params[:team_id])
    @team_user = @team.team_users.build(params[:user_id])

    respond_to do |format|
      if @team_user.save
        format.html { redirect_to @team, success: t('.flash.success.message') }
        format.js {}
      else
        format.html { render :new }
        format.js {}
      end
    end
  end
  
  private
  
  def team_user_params
    params.require(:team_user).permit(:team_id, :user_id)
  end
end