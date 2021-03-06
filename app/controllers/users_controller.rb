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
    @user = User.create(user_params)

    if @user.valid?
      flash[:success] = "Profile has been created successfully and logged in"
      session[:user_id] = @user.id
      redirect_to main_path
    else
      render 'new' #error: goes back to new page
    end

  end


  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "Profile has been updated successfully"
      redirect_to users_path
    else
      render 'edit'
    end

  end


  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:sucess] = "Account has been deleted successfuly"
      redirect_to users_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:fname,
                                   :lname,
                                   :nickname,
                                   :email,
                                   :password,
                                   :avatar)
    end

end
