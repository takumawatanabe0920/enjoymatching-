class InterestsController < ApplicationController
  require "pry"
  def new
    @interest = Interest.new
    @user = User.find(params[:user_id])
  end

  def create
    @interest  = Interest.create(interests_params)
    UserMailer.send_email(@interest).deliver
    redirect_back(fallback_location: root_path)
  end

  private
  def interests_params
    params.require(:interest).permit(:name, :email, :phonenumber, :content, :user_id)
  end
end
