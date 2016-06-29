class CommentsController < ApplicationController

  def create
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.create(comments_params)

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comments = @article.comments.find(params[:id])
    @comments.destroy

    redirect_to article_path(@article)
  end

private

  def comments_params
    params.require(:comment).permit(:name, :body)
  end
end
