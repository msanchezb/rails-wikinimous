class ArticlesController < ApplicationController
  before_action :article_search, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(title: article_params[:title], content: article_params[:content])
    redirect_to article_path(@article)
  end

  def edit
  end

  def update
    @article.update(title: article_params[:title], content: article_params[:content])
    @article.save

    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
  end

  private

  def article_search
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
