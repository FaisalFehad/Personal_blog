class UserNotifierMailer < ActionMailer::Base

  def send_comment_created_email(comment, article)
    @comment = comment
    @article = article

    mail( to:     "#{@article.user.email}",
          from:   'app52905832@heroku.com',
          subject: 'A new comment on your post.' )
  end


def send_article_created_email(follower, article)
    @article = article
    follower.each do |f|
      @follower = f
      mail to:       f.email,
           subject: "An article has been created",
           from:    'app52905832@heroku.com'
    end
  end
end
