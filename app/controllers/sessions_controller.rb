class SessionsController < ApplicationController
  skip_before_action :require_login
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user
      session[:current_user] = user
      redirect_to events_path, notice: "Logged in!"
    else
      flash.now.alert = "Name is invalid"
      render 'new'
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to root_path, notice: "Logged out!"
  end

end
