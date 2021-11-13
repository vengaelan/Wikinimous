class ArticlesController < ApplicationController
  # Show all articles
  def index
    @articles = Article.all
  end

  # Show one article
  def show
    @article = Article.find(params[:id])
  end

  # Create a new article
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to article_path(@article)
  end

  # Update an existing article
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  # strong params
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
