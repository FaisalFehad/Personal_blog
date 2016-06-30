class ArticleMailer < ActionMailer::Base

  def article_created(follower, article)
    @article = article
    follower.each do |f|
      mail to: f.email, from:'no_reply@gmail.com', subject: "An article has been created"
    end
  end
end
