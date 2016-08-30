class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end


  def create
    #just for log to check the parameters.
    #render plain: params[:article].inspect


    @article = Article.new(article_params)
    #.save will save to db
    @article.save

    #then we try to redirect to some page to show
    redirect_to articles_show(@articles)

  end


  private

    def article_params

      params.require(:article).permit(:title, :description)

    end


end
