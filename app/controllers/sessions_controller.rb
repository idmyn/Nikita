class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to ideas_path
    else
      flash[:notice] = "Sorry, we couldn't find a user with that email and password combination!"
      redirect_to new_session_path
    end
  end

  def destroy
  end
end
