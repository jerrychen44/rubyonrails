class ArticlesController < ApplicationController
  def new
    @article = Article.new
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


  def show

    @article = Article.find(params[:id])


  end


  private

    def article_params

      params.require(:article).permit(:title, :description)

    end


end
