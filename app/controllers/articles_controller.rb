class ArticlesController < ApplicationController
  def index
    @Articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
      if @article.save
        redirect_to @article
      else
        render 'new'
      end
    end

    def show
      @article = Article.friendly.find(params[:id])
    end

    def edit
      @article = Article.friendly.find(params[:id])
    end

    def update
      @article = Article.new.friendly.find(params[:id])
      if @article.update(params[:article].permit(:title, :content))
        redirect_to @article
      else
        render 'edit'
      end
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to root_path
    end

    private

    def find_article
      @article = Article.friendly.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, :slug)
    end
end
