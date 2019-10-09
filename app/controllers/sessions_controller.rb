class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    if login(email)
      flash[:success] = "ログインに成功しました。"
      redirect_to root_path
    else
      flash.now[:danger] = "ログインに失敗しました。"
      render "new"
    end
  end

  def destroy
  end

  private
  def login(email)
    @user  = User.find_by(email: email)
    session[:user_id] = @user.id
  end
end
