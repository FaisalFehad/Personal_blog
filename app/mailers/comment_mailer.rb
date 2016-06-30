class CommentMailer < ActionMailer::Base

  def comment_created(comment, article)
    @comment = comment
    @article = article

    mail( to: 'faisalfehad@gmail.com' ,
          from:'no_reply@gmail.com' ,
          subject:'A comment on your post.')
  end
end
