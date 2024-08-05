class UsersController < ApplicationController
  before_action set_user, only: [:show, :edit]

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit; end

  private
  def set_user
    @user = User.find_by(id: params[:id])
    unless @user
      flash[:alert] = "User not found"
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
end
