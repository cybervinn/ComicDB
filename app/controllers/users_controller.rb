class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Profile has been created"
      redirect_to root_path
    else
      render 'new' #error: goes back to new page
    end
  end

  def edit
    @user = User.find(id)
  end

  def update
  end

  def destroy
  end

  private

    def user_params
      params.require(:user).permit(:fname,
                                   :lname,
                                   :email,
                                   :password)
    end

end
