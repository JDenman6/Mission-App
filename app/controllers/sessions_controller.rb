class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(user_params)
    if @user.nil?
      @user = User.new
      render :new
    else
      sign_in(@user)
      redirect_to users_url
    end
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end
end
