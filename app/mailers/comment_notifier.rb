class CommentNotifier < ActionMailer::Base
  default :from => "#{Rails.application.name} " <<
    "<nobody@#{Rails.application.domain}>"

  def send_notification(comment_author, comment, post, post_author)
    @comment_author = comment_author
    @post = post
    @post_author = post_author
    @comment = comment

    mail(
      :from => "<notification@#{Rails.application.domain}>",
      :to => @post_author.email,
      :subject => "You have a new notification"
    )
  end
end
