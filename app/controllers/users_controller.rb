class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update,:destroy]
  def index
    @user = User.new
    @users = User.all
  end

  def show
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.send_signup_email(@user).deliver
      redirect_to(@user, :notice => 'User created')
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
end
