class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    #just for log to check the parameters.
    #render plain: params[:article].inspect


    @article = Article.new(article_params)

    if @article.save    #.save will save to db
      #if save to db successfully
      flash[:notice] = "Article saved!"
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

      @article = Article.find(params[:id])
      if @article.update(article_params)
        flash[:notice] = "Article updated!"
        redirect_to article_path(@article)
      else
        render 'edit'
      end
  end


  def show

    @article = Article.find(params[:id])


  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article deleted!!"
    redirect_to articles_path
  end

  private

    def article_params

      params.require(:article).permit(:title, :description)

    end


end
