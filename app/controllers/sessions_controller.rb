class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{current_user.fname}, you have successfully logged in"
      redirect_to main_path
    else
      flash.now[:danger] = "Your credentials are incorrect"
      render 'new'
    end

  end

  def destroy
    flash[:success] = "Goodbye #{current_user.fname}, you have been logged off"
    session[:user_id] = nil
    redirect_to root_path
  end

end
