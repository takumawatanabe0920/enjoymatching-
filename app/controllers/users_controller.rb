class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :user_type, :title, :content)
  end
end
