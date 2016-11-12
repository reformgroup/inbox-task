class TeamsController < ApplicationController
  before_action :set_team, :set_team_users, only: [:show, :edit, :update, :destroy]
  before_action :set_team_ancestry, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_new_team_user, only: [:new, :edit]
  before_action :logged_in_user
  
  layout 'sidebar'
  
  # GET /teams
  def index
    @teams = Team.search(params[:search], :name).sorting(params[:sort], params[:direction]).paginate(page: params[:page])
  end

  # GET /teams/1
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new(parent_id: params[:parent_id])
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  def create
    @team = Team.new(team_params)
    
    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, success: t('.flash.success.message') }
      else
        format.html { render :new, danger: t('.flash.danger.message') }
      end
    end
  end

  # PATCH/PUT /teams/1
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, success: t('.flash.success.message') }
      else
        format.html { render :edit, danger: t('.flash.danger.message') }
      end
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, success: t('.flash.success.message') }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end
    
    def set_team_ancestry
      @team_collection = Team.all.each { |c| c.ancestry = c.ancestry.to_s + (c.ancestry != nil ? "/" : '') + c.id.to_s 
      }.sort{ |x,y| x.ancestry <=> y.ancestry }.map{ |c| ["-" * (c.depth - 1) + c.name,c.id] }
    end
    
    def set_team_users
      @team_users_collection = User.all.collect { |p| [ p.name, p.id ] }
    end
    
    def set_new_team_user
      @team_users_new = @team.team_users.build
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(
        :name,
        :parent_id,
        team_users_attributes: [:_destroy, :id, :user_id]
      )
    end
end
