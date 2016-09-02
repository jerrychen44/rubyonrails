class UsersController < ApplicationController

  def index
    #@user = User.all
    @users = User.paginate(page: params[:page], per_page: 5)
  end

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


  def show
    @user = User.find(params[:id])

    #to add the pagination, we don't pass the user to pagination, becuase
    #we want is paginate the articles of one author.
    #so we get the articles to pass to @user_articles
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end



  private
  def user_params
    #get from html input by user.to save into params
    #so def create, def update can get the username, email and password
    params.require(:user).permit(:username, :email, :password)
  end
end
