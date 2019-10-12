class InterestsController < ApplicationController
  def new
    @interest = Interest.new
  end

  def create
    @interest  = Interest.create(interests_params)
    UserMailer.send_email(@interest).deliver
    redirect_back(fallback_location: root_path)
  end

  private
  def interests_params
    params.require(:interest).permit(:name, :email, :phonenumber, :content, :to_id)
  end
end
