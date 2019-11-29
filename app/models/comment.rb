# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  body             :text(65535)
#  commentable_type :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :bigint
#  parent_id        :integer
#  reader_id        :bigint
#
# Indexes
#
#  index_comments_on_commentable_type_and_commentable_id  (commentable_type,commentable_id)
#  index_comments_on_reader_id                            (reader_id)
#
# Foreign Keys
#
#  fk_rails_...  (reader_id => readers.id)
#

class Comment < ApplicationRecord
  belongs_to :reader
  belongs_to :commentable, polymorphic: true
  belongs_to :parent, optional: true, class_name: "Comment"


  def comments
    Comment.where(commentable: commentable, parent_id: id)
  end
end
