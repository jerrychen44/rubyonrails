class ArticlesController < ApplicationController

  before_action :set_article, only:[:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    #@articles = Article.all

    #per_page: 5 articls in one page
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def create
    #just for log to check the parameters.
    #render plain: params[:article].inspect

    #debugger

    @article = Article.new(article_params)
    #hard code an user first. since we have no loging system right now
    @article.user = current_user

    if @article.save    #.save will save to db
      #if save to db successfully
      flash[:success] = "Article saved!"
      #then we try to redirect to some page to show
      redirect_to article_path(@article)
    else
      #if save failed, will lead to 'new' pages
      #so go to new page to add some message to show the
      #error message
      render 'new'
    end

  end

  def update

      #@article = Article.find(params[:id])
      if @article.update(article_params)
        flash[:success] = "Article updated!"
        redirect_to article_path(@article)
      else
        render 'edit'
      end
  end


  def show

    #@article = Article.find(params[:id])


  end


  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = "Article deleted!"
    redirect_to articles_path
  end

  private

    def article_params

      #params.require(:article).permit(:title, :description)

      #add category_ids: array is becasue the create article behovior
      #will bring in the category id in an array. 
      params.require(:article).permit(:title, :description, category_ids: [])

    end

    def set_article
      @article = Article.find(params[:id])
    end

    def require_same_user
      if current_user != @article.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own article"
        redirect_to root_path
      end
    end


end
