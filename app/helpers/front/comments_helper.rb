module Front::CommentsHelper
  def reply_to_id(comment, nesting, max_nesting)
    (max_nesting.blank? || nesting < max_nesting) ? comment.id : comment.parent_id
  end
end
