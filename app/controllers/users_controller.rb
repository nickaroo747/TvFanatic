class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create] 
  before_action :authorized?, only: [:edit, :update] 

  #anytime a request comes to this controller, this is invoked and none of these actions will run without someone being logged in

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id.to_s
      flash[:welcome] = "Thanks for signing up, #{@user.name}!"
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:message] = "User profile successfully updated!"
      redirect_to users_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_login
    unless logged_in? #value coming in is false, this code executes, if true it won't -refers to logged on sessions pages
      flash[:error] = "You must be logged in to access that page!"
      redirect_to login_path
    end
  end

  def authorized?
    unless current_user == User.find(params[:id])
      flash[:error] = "You are not authorized to access that page."
      redirect_to users_path
    end
  end

end #end controller





















