class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :set_team_collection, only: [:new, :edit]
  before_action :logged_in_user
  
  layout 'sidebar'
  
  # GET /teams
  def index
    @teams = Team.search(params[:search], :name).sort(params[:sort], params[:direction]).paginate(page: params[:page])
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
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /teams/1
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end
    
    def set_team_collection
      @team_collection = Team.order(:name).map { |c| ["-" * c.depth + c.name,c.id] }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(
        :name,
        :parent_id
      )
    end
end
