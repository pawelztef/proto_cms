class Post < ApplicationRecord
  has_many :categorizations
  has_many :categories, :through => :categorizations
  has_many :tagizations
  has_many :tags, :through => :tagizations

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
