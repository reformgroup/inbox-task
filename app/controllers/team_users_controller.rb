class TeamUsersController < ApplicationController
  
  def new
    @team = Team.find(params[:team_id])
    @new_team_user = @team.team_users.build
    respond_to do |format|
      format.html { render :new }
      format.js {}
    end
  end
  
  def create
    @team = TeamUser.new(team_user_params)
    @team_user = @team.team_users.build(team_user_params)

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