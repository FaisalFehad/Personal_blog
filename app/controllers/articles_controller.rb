class ArticlesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @Articles = Article.all.order('created_at DESC')
  end

  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(article_params)
      if @article.save
        redirect_to @article
        @follower = Follower.all
        UserNotifierMailer.send_article_created_email(@follower, @article).deliver
        flash[:notice] = "The article has been created.Followers will shortly get an notiflcation email about it."
      else
        render 'new'
        flash[:alart] = "Article could not be created. Please make sure it has a valid title and contecnt you have the necessary permission then try again."
      end
    end

    def show
      find_article
    end

    def edit
      find_article
    end

    def update
      @article = Article.find_by_slug(params[:id])
      if @article.update(article_params)
        redirect_to @article
        flash[:notice] = "The article has been updated."
      else
        render 'edit'
      end
    end

    def destroy
      @article = Article.find_by_slug(params[:id])
      redirect_to root_path

      if @article.destroy
        flash[:notice] = "The article has been deleted."
      else
        flash[:alart] = "The article could not be deleted. Please make that you have the necessary permission and try again."
      end
    end

    private

    def find_article
      @article = Article.friendly.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, :slug, :image)
    end
end
