class Api::SessionsController < ApplicationController

  def create # login
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login(@user)
    else
      render json: ["I'm a teapot"], status: 418
    end
  end

  def destroy # logout
    if logged_in?
      logout
      render json: {}
    else
      render json: ["Not logged in"], status: 404
    end
  end

end
