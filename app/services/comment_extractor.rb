class CommentExtractor
  class << self
    attr_reader :comment

    def prepare_comment(comment)
      @comment = comment
      [ fetch_comment_author, fetch_comment_content, fetch_post_details, fetch_post_author ]
    end

    private

    def fetch_comment_content
      comment.comment
    end

    def fetch_comment_author
      User.find_by_id(comment.user_id)
    end

    def fetch_post_details
      Story.find_by_id(comment.story_id)
    end

    def fetch_post_author
      User.find_by_id(fetch_post_details.user_id)
    end
  end
end
