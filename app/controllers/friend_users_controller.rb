class FriendUsersController < ApplicationController
  before_action :set_friend_user, only: %i[ show edit update destroy ]

  # GET /friend_users or /friend_users.json
  def index
    @friend_users = FriendUser.all
    @users = User.all
  end

  # GET /friend_users/1 or /friend_users/1.json
  def show
  end

  # GET /friend_users/new
  def new
    @friend_user = FriendUser.new
  end

  # GET /friend_users/1/edit
  def edit
  end

  # POST /friend_users or /friend_users.json
  def create
    @friend_users = FriendUser.all
    @users = User.all
    @user = User.find_by(params[:id])

    @make_friend = FriendUser.new(friend_id: @user.id, user_id: current_user.id)
  end

  # PATCH/PUT /friend_users/1 or /friend_users/1.json
  def update
    # respond_to do |format|
    #   if @friend_user.update(friend_user_params)
    #     format.html { redirect_to @friend_user, notice: "Friend user was successfully updated." }
    #     format.json { render :show, status: :ok, location: @friend_user }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @friend_user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /friend_users/1 or /friend_users/1.json
  def destroy
    @friend_user.destroy!

    respond_to do |format|
      format.html { redirect_to friend_users_path, status: :see_other, notice: "Friend user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_friend_user
  #     @friend_user = FriendUser.find(params[:id])
  #   end

  #   # Only allow a list of trusted parameters through.
  #   def friend_user_params
  #     params.require(:friend_user).permit(:user_id, :friend_id)
  #   end

  def follow
    FriendUser.create(friend_id: params[:id], user_id: current_user.id)
  end
end
