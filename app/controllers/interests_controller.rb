class InterestsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user  = User.new(interests_params)
    UserMailer.send_email(@user).deliver
  end

  private
  def interests_params
    params.require(:user).permit(:name, :email, :phonenumber, :content)
  end
end
