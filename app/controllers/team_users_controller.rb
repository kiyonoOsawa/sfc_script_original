class TeamUsersController < ApplicationController
  before_action :set_team_user, only: %i[ show edit update destroy ]

  # GET /team_users or /team_users.json
  def index
    @team_users = TeamUser.all
  end

  # GET /team_users/1 or /team_users/1.json
  def show
  end

  # GET /team_users/new
  def new
    @team_user = TeamUser.new
  end

  # GET /team_users/1/edit
  def edit
  end

  # POST /team_users or /team_users.json
  def create
    @team_user = TeamUser.new(team_user_params)

    respond_to do |format|
      if @team_user.save
        format.html { redirect_to @team_user, notice: "Team user was successfully created." }
        format.json { render :show, status: :created, location: @team_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_users/1 or /team_users/1.json
  def update
    respond_to do |format|
      if @team_user.update(team_user_params)
        format.html { redirect_to @team_user, notice: "Team user was successfully updated." }
        format.json { render :show, status: :ok, location: @team_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_users/1 or /team_users/1.json
  def destroy
    @team_user.destroy!

    respond_to do |format|
      format.html { redirect_to team_users_path, status: :see_other, notice: "Team user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_user
      @team_user = TeamUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_user_params
      params.require(:team_user).permit(:user_id, :task_id)
    end
end
