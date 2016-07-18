class ArticlesController < ApplicationController
  def new
    @articles = Article.new
  end

  def create
    #render plain: params[:article].inspect #displays
    @articles = Article.new(article_params)
    #@article.save
    #redirect_to article_path(@article)
    if @articles.save
      flash[:notice] = "Artice was successfully created"
      redirect_to article_path(@articles)
    else
      render :new
    end
  end

  def show
    @articles = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)

    end

end