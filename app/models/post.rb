# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  permalink  :string(255)
#  status     :integer          default("draft")
#  summary    :text(65535)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blog_id    :bigint
#
# Indexes
#
#  index_posts_on_blog_id    (blog_id)
#  index_posts_on_permalink  (permalink)
#
# Foreign Keys
#
#  fk_rails_...  (blog_id => blogs.id)
#

class Post < ApplicationRecord
  belongs_to :blog
  has_many :categorizations
  has_many :categories, :through => :categorizations
  has_many :tagizations
  has_many :tags, :through => :tagizations
  has_many :comments, as: :commentable

  enum status: ContentStatus::STATUSES

  scope :published, ->  { where(status: :published) }
  scope :draft, -> { where(status: :draft) }
 
  attr_accessor :submit_option

  def self.search_by_status(status)
    if status == "all" || !status.present?
      Post.all
    else
      Post.where(status: status)
    end
  end

  def self.get_stats
    stats = Post.all.group(:status).count
    stats["all"] = stats.inject(0) { |sum, hash| sum += hash[1] }
    return stats
  end

  # TODO change permalink post field to slug
  def to_param
    permalink
  end


end
