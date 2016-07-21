class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:create]

  def create
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.create(comments_params)
      if @comment.save
        UserNotifierMailer.send_comment_created_email(@comment, @article).deliver
        redirect_to article_path(@article)
        flash[:notice] = "Your comment has successfully been submitted, and the creater of the post got notified."
      else
        redirect_to article_path(@article)
        flash[:alert] = "Could not be saved.Please make make sure that the comment and name are valid."
      end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comments = @article.comments.find(params[:id])
    redirect_to article_path(@article)

    if  @comments.destroy
      flash[:notice] = "Comment has been deleted."
    else
      flash[:alert] = "The comment could not be deleted, Please try again."
    end
  end

private

  def comments_params
    params.require(:comment).permit(:name, :body)
  end
end
