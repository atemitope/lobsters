class Notifier
  def self.notify_author(comment, mailer)
    extracted_comment = CommentExtractor.prepare_comment(comment)
    mailer.send_notification(*extracted_comment).deliver
  end
end
