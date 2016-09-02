class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #debugger
    @user= User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the alpha blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end

  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params) #if update ok
      #show the flash message at the top, success = green color
      flash[:success] = "Your account was update successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end




  private
  def user_params
    #get from html input by user.to save into params
    #so def create, def update can get the username, email and password
    params.require(:user).permit(:username, :email, :password)
  end
end
