class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  belongs_to :parent, optional: true, class_name: "Comment"


  def comments
    Comment.where(commentable: commentable, prent_id: id)
  end
end