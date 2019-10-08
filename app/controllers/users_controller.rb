class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update,:destroy]
  before_save :send_email, only:[:create]
  def index
    @user = User.new
    @users = User.all
  end

  def show
  end

  def new
  end

  def create
    if @user.save
      redirect_to root_path
    else
      render "index"
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to root_path
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :user_type, :title, :content)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def send_email
    @user = User.new(user_params)
    UserMailer.send_signup_email(@user).deliver
  end
end
