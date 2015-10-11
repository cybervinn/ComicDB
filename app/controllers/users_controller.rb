class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

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

    if @user.destroy
      flash[:success] = "Account has been deleted successfuly"
      redirect_to users_path
    end

  end

  private

    def user_params
      params.require(:user).permit(:fname,
                                   :lname,
                                   :nickname,
                                   :admin,
                                   :email,
                                   :password,
                                   :avatar)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def require_same_user

      if current_user != @user && !current_user.admin?
        flash[:danger] = "You can only edit your own profile #{current_user.nickname}"
        redirect_to :back
      end
    end


end
