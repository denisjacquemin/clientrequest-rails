class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.all
    @user = User.new
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  def create_invitation
    @user = User.new(new_invitation_params)
    @user.invited_by_id = current_user.id
    @user.invitation_created_at = Date.new
    @user.invitation_token = 'token' #todo generate token
  
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

  def new_invitation_params
    params.require(:user).permit(:email)
  end

end
